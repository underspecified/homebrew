require 'formula'

# Documentation: https://github.com/mxcl/homebrew/wiki/Formula-Cookbook
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class SvmtoolModelsEnRobust < Formula
  homepage 'http://www.lsi.upc.edu/~nlp/SVMTool/#'
  url 'http://www.lsi.upc.edu/~nlp/SVMTool/faust_model_robust.tar.gz'
  sha1 ''
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
