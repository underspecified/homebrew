require 'formula'

# Documentation: https://github.com/mxcl/homebrew/wiki/Formula-Cookbook
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class VowpalWabbit < Formula
  homepage 'https://github.com/JohnLangford/vowpal_wabbit'
  url 'https://github.com/JohnLangford/vowpal_wabbit/zipball/6.1'
  sha1 '5328e83f413a99833b3db75e7f9dc59e4b5f8c59'

  depends_on 'boost' => :build

  def patches
    # rename boost library
    DATA
  end

  def install
    system "make all spanning_tree"
    bin.install 'vw', 'active_interactor', 'cluster/spanning_tree', Dir['utl/*']
    prefix.install 'README', 'cluster', 'test'
  end

  def test
    system "cd #{prefix}/test && ./RunTests -f -E 0.001 /usr/local/bin/vw /usr/local/bin/vw"
  end
end


__END__
diff --git i/Makefile w/Makefile
index a0fd33e..e27c787 100644
--- i/Makefile
+++ w/Makefile
@@ -1,15 +1,9 @@
 COMPILER = g++
 UNAME := $(shell uname)
 
-ifeq ($(UNAME), FreeBSD)
-LIBS = -l boost_program_options	-l pthread -l z -l compat
+LIBS = -l boost_program_options-mt -l pthread -l z
 BOOST_INCLUDE = /usr/local/include
 BOOST_LIBRARY = /usr/local/lib
-else
-LIBS = -l boost_program_options -l pthread -l z
-BOOST_INCLUDE = /usr/include
-BOOST_LIBRARY = /usr/local/lib
-endif
 
 ARCH = $(shell test `g++ -v 2>&1 | tail -1 | cut -d ' ' -f 3 | cut -d '.' -f 1,2` \< 4.3 && echo -march=nocona || echo -march=native)
 
