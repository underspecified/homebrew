require 'formula'

# Documentation: https://github.com/mxcl/homebrew/wiki/Formula-Cookbook
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class OpennlpEnToken < Formula
  homepage 'http://opennlp.sourceforge.net/models-1.5/'
  url 'http://opennlp.sourceforge.net/models-1.5/en-token.bin', :using => :nounzip
  version '1.5'
  sha1 'b9a0168d52518dbe30698fa226e51fc2525f0658'
end

class OpennlpEnSent < Formula
  homepage 'http://opennlp.sourceforge.net/models-1.5/'
  url 'http://opennlp.sourceforge.net/models-1.5/en-sent.bin', :using => :nounzip
  version '1.5'
  sha1 '5cc6337965fa2236ad7f089cc23ea884c6e0dc50'
end

class OpennlpEnPosMaxent < Formula
  homepage 'http://opennlp.sourceforge.net/models-1.5/'
  url 'http://opennlp.sourceforge.net/models-1.5/en-pos-maxent.bin', :using => :nounzip
  version '1.5'
  sha1 '1cc32d397dd22570dd2b5d85e853f39f048caa3f'
end

class OpennlpEnPosPerceptron < Formula
  homepage 'http://opennlp.sourceforge.net/models-1.5/'
  url 'http://opennlp.sourceforge.net/models-1.5/en-pos-perceptron.bin', :using => :nounzip
  version '1.5'
  sha1 '4ef454704f0af7c662db59608168104279d16da7'
end

class OpennlpEnNerDate < Formula
  homepage 'http://opennlp.sourceforge.net/models-1.5/'
  url 'http://opennlp.sourceforge.net/models-1.5/en-ner-date.bin', :using => :nounzip
  version '1.5'
  sha1 'd30dc8e151690968343826f36fc8141a16b47e82'
end

class OpennlpEnNerLocation < Formula
  homepage 'http://opennlp.sourceforge.net/models-1.5/'
  url 'http://opennlp.sourceforge.net/models-1.5/en-ner-location.bin', :using => :nounzip
  version '1.5'
  sha1 'a42338f74462b1aacda1027fefba5ba998c25c30'
end

class OpennlpEnNerMoney < Formula
  homepage 'http://opennlp.sourceforge.net/models-1.5/'
  url 'http://opennlp.sourceforge.net/models-1.5/en-ner-money.bin', :using => :nounzip
  version '1.5'
  sha1 'c397b7b9b63a2732a2e07a8b1d277cb7876c9f03'
end

class OpennlpEnNerOrganization < Formula
  homepage 'http://opennlp.sourceforge.net/models-1.5/'
  url 'http://opennlp.sourceforge.net/models-1.5/en-ner-organization.bin', :using => :nounzip
  version '1.5'
  sha1 '1bbecaa28eac09436d7ecdecaea20a1074cce9b1'
end

class OpennlpEnNerPercentage < Formula
  homepage 'http://opennlp.sourceforge.net/models-1.5/'
  url 'http://opennlp.sourceforge.net/models-1.5/en-ner-percentage.bin', :using => :nounzip
  version '1.5'
  sha1 '3f0d83e5ea7f2e8419134a2b446a509cff61f24c'
end

class OpennlpEnNerPerson < Formula
  homepage 'http://opennlp.sourceforge.net/models-1.5/'
  url 'http://opennlp.sourceforge.net/models-1.5/en-ner-person.bin', :using => :nounzip
  version '1.5'
  sha1 '78da74299ae61b263846885ce012c45aeefeb627'
end

class OpennlpEnNerTime < Formula
  homepage 'http://opennlp.sourceforge.net/models-1.5/'
  url 'http://opennlp.sourceforge.net/models-1.5/en-ner-time.bin', :using => :nounzip
  version '1.5'
  sha1 '9e0a9a456a529710955cefdf7e4f921f7ced70c9'
end

class OpennlpEnChunker < Formula
  homepage 'http://opennlp.sourceforge.net/models-1.5/'
  url 'http://opennlp.sourceforge.net/models-1.5/en-chunker.bin', :using => :nounzip
  version '1.5'
  sha1 '9aa9314c0917a05440367dc62bf52959baa4f1c1'
end

class OpennlpEnParserChunking < Formula
  homepage 'http://opennlp.sourceforge.net/models-1.5/'
  url 'http://opennlp.sourceforge.net/models-1.5/en-parser-chunking.bin', :using => :nounzip
  version '1.5'
  sha1 '4e7b164d2519e55c673087670b52759f7084d621'
end

class Opennlp < Formula
  homepage 'http://opennlp.apache.org/index.html'
  url 'http://ftp.kddilabs.jp/infosystems/apache//incubator/opennlp/apache-opennlp-1.5.2-incubating-bin.tar.gz'
  version '1.5.2'
  sha1 '4871636ce6e630e4c91b26ff47e0fdbee8ef8ddf'

  def patches
    # install to libexec/ instead of lib/
    DATA
  end

  def install
    system "mkdir libexec"
    OpennlpEnToken.new.brew { libexec.install Dir['*'] }
    OpennlpEnSent.new.brew { libexec.install Dir['*'] }
    OpennlpEnPosMaxent.new.brew { libexec.install Dir['*'] }
    OpennlpEnPosPerceptron.new.brew { libexec.install Dir['*'] }
    OpennlpEnNerDate.new.brew { libexec.install Dir['*'] }
    OpennlpEnNerLocation.new.brew { libexec.install Dir['*'] }
    OpennlpEnNerMoney.new.brew { libexec.install Dir['*'] }
    OpennlpEnNerOrganization.new.brew { libexec.install Dir['*'] }
    OpennlpEnNerPercentage.new.brew { libexec.install Dir['*'] }
    OpennlpEnNerPerson.new.brew { libexec.install Dir['*'] }
    OpennlpEnNerTime.new.brew { libexec.install Dir['*'] }
    OpennlpEnNerPerson.new.brew { libexec.install Dir['*'] }
    OpennlpEnChunker.new.brew { libexec.install Dir['*'] }
    OpennlpEnParserChunking.new.brew { libexec.install Dir['*'] }
    system "mv libexec model"
    #system "mkdir libexec"
    #system "mv lib/*.jar libexec/"
    #system "rm -rf lib"
    #system "rm -f bin/opennlp.bat"
    prefix.install Dir['*']
  end
end

__END__
diff --git i/bin/opennlp w/bin/opennlp
index 6e2fdd2..8b40b6f 100755
--- i/bin/opennlp
+++ w/bin/opennlp
@@ -30,6 +30,6 @@ if [ -z "$JAVACMD" ] ; then
 fi
 
 # Might fail if $0 is a link
-OPENNLP_HOME=`dirname "$0"`/..
+OPENNLP_HOME=$(grealpath "$(dirname $(grealpath $0))/..")
 
-$JAVACMD -Xmx1024m -jar $OPENNLP_HOME/lib/opennlp-tools-*.jar $@
+$JAVACMD -Xmx1024m -jar $OPENNLP_HOME/libexec/opennlp-tools-*.jar $@
