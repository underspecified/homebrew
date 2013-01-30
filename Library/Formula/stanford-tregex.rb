require 'formula'

class StanfordTregex < Formula
  url 'http://nlp.stanford.edu/software/stanford-tregex-2012-11-11.zip'
  homepage 'http://nlp.stanford.edu/software/tregex.shtml'
  sha1 '3b1620f5eaf97869293c519ce26446466df8ea20'
  version '2.0.5'

  depends_on 'coreutils'
  def patches
    # fix paths in utility script
    DATA
  end

  def install
    prefix.install Dir['examples', 'LICENSE.txt', 'README-gui.txt', 'README-tregex.txt', 'README-tsurgeon.txt', 'Semgrex.ppt']
    bin.install Dir['run-tregex-gui.command', 'tregex.sh', 'tsurgeon.sh']
    libexec.install Dir['stanford-tregex-2.0.5-javadoc.jar', 'stanford-tregex-2.0.5.jar', 'stanford-tregex.jar']
  end
end


__END__
diff --git i/run-tregex-gui.command w/run-tregex-gui.command
index caf22d5..ceb3789 100755
--- i/run-tregex-gui.command
+++ w/run-tregex-gui.command
@@ -1,2 +1,4 @@
-#!/bin/sh
-java -mx300m -cp `dirname $0`/stanford-tregex.jar edu.stanford.nlp.trees.tregex.gui.TregexGUI
+#!/bin/bash
+scriptdir=$(grealpath "$(dirname $(grealpath $0))/../libexec")
+
+java -mx300m -cp "$scriptdir/stanford-tregex.jar:" edu.stanford.nlp.trees.tregex.gui.TregexGUI
diff --git i/tregex.sh w/tregex.sh
index 8f52aed..38f2035 100755
--- i/tregex.sh
+++ w/tregex.sh
@@ -1,4 +1,4 @@
-#!/bin/sh
-scriptdir=`dirname $0`
+#!/bin/bash
+scriptdir=$(grealpath "$(dirname $(grealpath $0))/../libexec")
 
 java -mx100m -cp "$scriptdir/stanford-tregex.jar:" edu.stanford.nlp.trees.tregex.TregexPattern "$@"
diff --git i/tsurgeon.sh w/tsurgeon.sh
index 747302d..dd1a361 100755
--- i/tsurgeon.sh
+++ w/tsurgeon.sh
@@ -1,4 +1,4 @@
-#!/bin/sh
+#!/bin/bash
+scriptdir=$(grealpath "$(dirname $(grealpath $0))/../libexec")
 
-export CLASSPATH=stanford-tregex.jar:$CLASSPATH
-java -mx100m edu.stanford.nlp.trees.tregex.tsurgeon.Tsurgeon "$@"
+java -mx100m -cp "$scriptdir/stanford-tregex.jar:" edu.stanford.nlp.trees.tregex.tsurgeon.Tsurgeon "$@"
