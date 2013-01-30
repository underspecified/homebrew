require 'formula'

class StanfordCorenlp < Formula
  url 'http://nlp.stanford.edu/software/stanford-corenlp-2012-07-09.tgz'
  homepage 'http://nlp.stanford.edu/software/corenlp.shtml'
  md5 'bc34347cb5f0d58aa7c293a2f5190ff2'
  version '1.3.3'

  depends_on 'coreutils'

  def patches
    # fix paths in utility script
    DATA
  end

  def install
    prefix.install Dir['LIBRARY-LICENSES', 'LICENSE.txt', 'README.txt', ]
    bin.install Dir['corenlp.sh']
    libexec.install Dir['CoreNLP-to-HTML.xsl', 'joda-time.jar', 'xom.jar',
			'stanford-corenlp-2012-07-09.jar', 'stanford-corenlp-2012-07-09-javadoc.jar', 
			'stanford-corenlp-2012-07-06-models.jar']
  end
end

__END__
diff --git i/corenlp.sh w/corenlp.sh
index 34edb5c..b7eeb75 100755
--- i/corenlp.sh
+++ w/corenlp.sh
@@ -1,11 +1,12 @@
-#!/usr/bin/env bash
+#!/bin/bash
 #
 # Runs Stanford CoreNLP.
 # Simple uses for xml and plain text output to files are:
 #    ./corenlp.sh -file filename
 #    ./corenlp.sh -file filename -outputFormat text 
 
-scriptdir=`dirname $0`
+scriptdir=$(grealpath "$(dirname $(grealpath $0))/../libexec")
 
-echo -mx3g -cp "$scriptdir/*.jar" edu.stanford.nlp.pipeline.StanfordCoreNLP $*
-java -mx3g -cp "$scriptdir/*.jar" edu.stanford.nlp.pipeline.StanfordCoreNLP $*
+cmd="java -mx3g -cp \"$scriptdir/*\" edu.stanford.nlp.pipeline.StanfordCoreNLP $*"
+echo $cmd
+eval $cmd
