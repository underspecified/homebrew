require 'formula'

# Documentation: https://github.com/mxcl/homebrew/wiki/Formula-Cookbook
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class MaltparserEngmaltLinear < Formula
  homepage 'http://www.maltparser.org/mco/english_parser/engmalt.html'
  url 'http://www.maltparser.org/mco/english_parser/engmalt.linear-1.7.mco', :using => :nounzip
  sha1 '441217eeca3c7999dd86615286e307e1f19eb86e'
  version = '1.7'
end

class MaltparserEngmaltPoly < Formula
  homepage 'http://www.maltparser.org/mco/english_parser/engmalt.html'
  url 'http://www.maltparser.org/mco/english_parser/engmalt.poly-1.7.mco', :using => :nounzip
  sha1 'cab7e8249d27d785321eb52892814b89a8ddabb6'
  version = '1.7.1'
end

class Maltparser < Formula
  homepage 'http://maltparser.org'
  url 'http://maltparser.org/dist/maltparser-1.7.1.tar.gz'
  sha1 'e9caa6801f83af7e180ad39b401c8fc3a9f91353'

  def patches
    # install to libexec/ instead of lib/
    # inreplace 'build.xml' do |s|
    #   s.gsub! /\/lib\b/, '\/libexec'
    # end
    # utilities for calling parser
    DATA
  end

  def install
    system "mv lib/*.jar libexec/"
    system "rm -rf lib"
    system "rm maltparser-*.jar"
    system "ant clean jar"
    #libexec.install Dir['dist/maltparser-*/libexec/*']
    prefix.install Dir['dist/maltparser-*/maltparser-*.jar']
    system "ant clean"
    prefix.install Dir['*']
    chmod 0755, libexec+'maltparser_linear'
    chmod 0755, libexec+'maltparser_poly'
    bin.mkdir
    ln_sf libexec+'maltparser_linear', bin
    ln_sf libexec+'maltparser_poly', bin
    MaltparserEngmaltLinear.new.brew { libexec.install Dir['*'] }
    MaltparserEngmaltPoly.new.brew { libexec.install Dir['*'] }
  end

  def test
    system "java -jar maltparser-1.7.1.jar"
  end
end

__END__
diff --git 1/libexec/maltparser_linear 2/libexec/maltparser_linear
new file mode 100755
index 0000000..2dc2209
--- /dev/null
+++ 2/libexec/maltparser_linear
@@ -0,0 +1,9 @@
+#!/bin/bash
+
+CURDIR=$PWD
+IN=${1:+$(grealpath $1)}
+OUT=${2:+$(grealpath $2)}
+LIBEXEC=$(grealpath $(dirname $(grealpath $0)))
+CMD="cd $LIBEXEC && java -Xmx1024m -jar $LIBEXEC/../maltparser-1.7.1.jar -c engmalt.linear-1.7 -i $IN -o $OUT -m parse && cd $CURDIR"
+#echo $CMD
+eval $CMD
diff --git 1/libexec/maltparser_poly 2/libexec/maltparser_poly
new file mode 100755
index 0000000..595457e
--- /dev/null
+++ 2/libexec/maltparser_poly
@@ -0,0 +1,9 @@
+#!/bin/bash
+
+CURDIR=$PWD
+IN=${1:+$(grealpath $1)}
+OUT=${2:+$(grealpath $2)}
+LIBEXEC=$(grealpath $(dirname $(grealpath $0)))
+CMD="cd $LIBEXEC && java -Xmx1024m -jar $LIBEXEC/../maltparser-1.7.1.jar -c engmalt.poly-1.7 -i $IN -o $OUT -m parse && cd $CURDIR"
+#echo $CMD
+eval $CMD
diff --git i/build.properties w/build.properties
index bfee04d..5b4d2d1 100644
--- i/build.properties
+++ w/build.properties
@@ -1,7 +1,7 @@
 #
 #   base location of support directories
 #
-lib.home.dir=lib
+lib.home.dir=libexec
 
 libsvm.jar=${lib.home.dir}/libsvm.jar
 liblinear.jar=${lib.home.dir}/liblinear-1.8.jar
diff --git i/build.xml w/build.xml
index 964395f..3af4895 100644
--- i/build.xml
+++ w/build.xml
@@ -40,7 +40,7 @@
 	<property name="dist.images" value="${dist.dir}/images"/>
 
 	<!-- Destination for generated jar files -->
-	<property name="jar.dest" value="${dist.dir}/lib"/>
+	<property name="jar.dest" value="${dist.dir}/libexec"/>
 
 	<!-- The jar file that the jar task will generate -->
 	<property name="jar.filename" value="maltparser-${version}.jar"/>
@@ -172,7 +172,7 @@
 		<mkdir dir="${jar.dest}"/>
 		<filter token="version" value="${version}" />
 		<manifest file="${dist.dir}/MANIFEST.MF">
-			<attribute name="Class-Path" value="lib/log4j.jar lib/libsvm.jar lib/liblinear-1.8.jar  "/>
+			<attribute name="Class-Path" value="libexec/log4j.jar libexec/libsvm.jar libexec/liblinear-1.8.jar  "/>
 			<attribute name="Main-Class" value="org.maltparser.Malt"/>
 			<attribute name="Implementation-Title" value="MaltParser"/>
 			<attribute name="Implementation-Version" value="${version}"/>
@@ -193,7 +193,7 @@
              destdir="${javadoc.dest}"
              packagenames="org.maltparser.core.*,
 		                   org.maltparser.ml,
-		                   org.maltparser.ml.lib,
+		                   org.maltparser.ml.libexec,
 		                   org.maltparser.parser.*,
 		                   org.maltparser.transform.*"
              version="true"
@@ -248,7 +248,7 @@
 					 appdata/**,
 				     examples/**,
 					 docs/xslt/**,
-					 lib/**,
+					 libexec/**,
                      build.xml,
                      build.properties,
                      LICENSE,
