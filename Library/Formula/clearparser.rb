require 'formula'

# Documentation: https://github.com/mxcl/homebrew/wiki/Formula-Cookbook
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class ClearparserSys < Formula
  url 'http://clearparser.googlecode.com/files/clearparser-sys.tar.gz'
  sha1 '1765e8d751c12772afdb79d65599dc88fc14c86b'
  version '1.0'
end

class EnPosOntonotes < Formula
  url 'http://verbs.colorado.edu/~choijd/clearparser/models/en_pos_ontonotes.jar'
  sha1 '9308c512e73e9e4a949fa28ee6936b2028ddac80'
  version '1.0'
end

class EnDepOntonotes < Formula
  url 'http://verbs.colorado.edu/~choijd/clearparser/models/en_dep_ontonotes.jar'
  sha1 '280a2cd5b90e50dbb83f2fb551bd23ff41293d36'
  version '1.0'
end

class EnSrlOntonotes < Formula
  url 'http://verbs.colorado.edu/~choijd/clearparser/models/en_srl_ontonotes.jar'
  sha1 '6b9e5fc8e7c46b08c1e4470833c50454d95ca008'
  version '1.0'
end

class Clearparser < Formula
  homepage 'http://code.google.com/p/clearparser/'
  url 'http://clearparser.googlecode.com/files/clearparser-0.33b.jar'
  sha1 '3a0932a0223e8df05796ac0685b149a4dbddcc5d'

  def patches
    # utility for calling java with the right classpath for using clearparser
    DATA
  end

  def install
    system "echo Installing Clear Parser system files..."
    ClearparserSys.new.brew do
      libexec.install Dir['lib/*']
      prefix.install Dir['*']
    end
    system "echo Installing Clear Parser..."
    bin.install Dir['bin/*']
    libexec.install Dir['*']
    model = prefix+"model"
    system "echo Installing English OntoNotes POS tagging model..."
    EnPosOntonotes.new.brew { model.install Dir['*'] }
    system "echo Installing English OntoNotes dependency parsing model..."
    EnDepOntonotes.new.brew { model.install Dir['*'] }
    system "echo Installing English OntoNotes semantic role labeling model..."
    EnSrlOntonotes.new.brew { model.install Dir['*'] }
  end

  def test
    system "clearparser_test"
  end
end

__END__
diff --git 1/bin/clearparser_java 2/bin/clearparser_java
new file mode 100755
index 0000000..0000001
--- /dev/null
+++ 2/bin/clearparser_java
@@ -0,0 +1,6 @@
+#!/bin/bash
+
+JAR_PATH=$(grealpath "$(dirname $(grealpath $0))/../libexec")
+CMD="java -cp \"$JAR_PATH/*\" $*"
+#echo $CMD
+eval $CMD
diff --git 1/bin/clearparser_en_dep 2/bin/clearparser_en_dep
new file mode 100755
index 0000000..0000002
--- /dev/null
+++ 2/bin/clearparser_en_dep
@@ -0,0 +1,5 @@
+#!/bin/bash
+
+BIN_DIR=$(grealpath $(dirname $(grealpath ($0)))
+PATH=$PATH:$BIN_DIR
+clearparser_java -XX:+UseConcMarkSweepGC -Xmx6g clear.engine.DepPredict -c config/config_dep_en.xml -m model/en_dep_ontonotes.jar -i $1 -o $2
diff --git 1/bin/clearparser_en_srl 2/bin/clearparser_en_srl
new file mode 100755
index 0000000..0000003
--- /dev/null
+++ 2/bin/clearparser_en_srl
@@ -0,0 +1,5 @@
+#!/bin/bash
+
+BIN_DIR=$(grealpath $(dirname $(grealpath ($0)))
+PATH=$PATH:$BIN_DIR
+clearparser_java -XX:+UseConcMarkSweepGC -Xmx1g clear.engine.SRLPredict -c config/config_srl_en.xml -m model/en_srl_ontonotes.jar -i $1 -o $2
diff --git 1/bin/clearparser_test 2/bin/clearparser_test
new file mode 100755
index 0000000..0000004
--- /dev/null
+++ 2/bin/clearparser_test
@@ -0,0 +1,50 @@
+#!/bin/bash
+
+BIN_DIR=$(grealpath $(dirname $(grealpath ($0)))
+PATH=$PATH:$BIN_DIR
+
+cd $BIN_DIR/..
+mkdir -p test
+
+(
+echo Testing penn-to-dependency ...
+#java clear.engine.PennToDep -i <input file> -o <output file> -h <headrule file> [-m <dictionary-file> -n <minimum sentence length> -l <language> -f -e]
+clearparse_java clear.engine.PennToDep -i dat/sample.phrase -o test/sample.dep -h config/headrule_en_ontonotes.txt -m model/en_dict-1.0.jar -n 2 -l en -f
+diff data/sample.dep test/sample.dep
+
+echo Testing prop-to-dependency ...
+#java clear.engine.PropToDep -i <input file> -o <output directory> -p <parse directory> -h <headrule file> [-m <dictionary-file> -n <minimum sentence length> -f -e -j]
+clearparser_java clear.engine.PropToDep -i dat/sample.prop -o test/ -p dat/ -h config/headrule_en_ontonotes.txt -m model/en_dict-1.0.jar
+diff dat/wsj_0001.parse.srl test/wsj_0001.parse.srl
+
+echo Testing morph ...
+#java clear.engine.MorphAnalyze -i <input file> -o <output file> -d <dictionary jar-file>
+clearparser_java clear.engine.MorphAnalyze -i dat/morph.in -o test/morph.out -d model/en_dict-1.0.jar
+diff dat/morph.out test/morph.out
+
+echo Testing dependency model training ...
+#java clear.engine.DepTrain -c <configuration file> -t <feature template file> -i <train file> -m <model file> [-n <bootstrapping level>]
+clearparser_java -XX:+UseConcMarkSweepGC -Xmx4g clear.engine.DepTrain -c config/config_dep_en.xml -t config/feature_dep_en_conll09.xml -i dat/sample.dep -m +test/sample_dep.mod
+
+echo Testing dependency parser decoding ...
+#java clear.engine.DepPredict -c <configuration file> -m <model file> -i <input file> -o <output file>
+clearparser_java -XX:+UseConcMarkSweepGC -Xmx6g clear.engine.DepPredict -c config/config_dep_en.xml -m test/sample_dep.mod -i dat/sample.dep -o test/sample.dep
+#diff dat/sample.dep test/sample.dep
+
+echo Testing dependency evaluation ...
+#java clear.engine.DepEvaluate -g <gold-standard file> -s <system file>
+clearparser_java clear.engine.DepEvaluate -g dat/sample.dep -s test/sample.dep
+
+echo Testing SRL labeler training ...
+#java clear.engine.SRLTrain -c <configuration file> -t <feature template file> -i <train file> -m <model file> [-n <bootstrapping level>]
+clearparser_java -XX:+UseConcMarkSweepGC -Xmx4g clear.engine.SRLTrain -c config/config_srl_en.xml -t config/feature_srl_en_conll09.xml -i dat/wsj_0001.parse.srl -m test/sample_srl.mod
+
+echo Testing SRL labeler decoding ...
+#java clear.engine.SRLPredict -c <configuration file> -m <model file> -i <input file> -o <output file>
+clearparser_java -XX:+UseConcMarkSweepGC -Xmx1g clear.engine.SRLPredict -c config/config_srl_en.xml -m test/sample_srl.mod -i dat/wsj_0001.parse.srl -o test/wsj_0001.parse.srl
+#diff dat/wsj_0001.parse.srl test/wsj_0001.parse.srl
+
+echo Testing SRL labeler ...
+#java clear.engine.SRLEvaluate -g <gold-standard file> -s <system file>
+clearparser_java clear.engine.SRLEvaluate -g dat/wsj_0001.parse.srl -s test/wsj_0001.parse.srl
+) | tee test/test.log
