require 'formula'

# Documentation: https://github.com/mxcl/homebrew/wiki/Formula-Cookbook
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class SvmtoolModelsEnWsj < Formula
  homepage 'http://www.lsi.upc.edu/~nlp/SVMTool/#'
  url 'http://www.lsi.upc.edu/~nlp/SVMTool/SVMT.eng.tar.gz'
  sha1 '90f9dc1eaa7b5a4848d927d5ccebd67a501a56d3'
  version '1.0'

  depends_on 'svmtool'

  def install
    prefix.install Dir['*']
  end

  def test
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test SVMToolModelsEnWSJ`.
    system "false"
  end
end
