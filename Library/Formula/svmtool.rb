require 'formula'

# Documentation: https://github.com/mxcl/homebrew/wiki/Formula-Cookbook
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Svmtool < Formula
  homepage 'http://www.lsi.upc.edu/~nlp/SVMTool/'
  url 'http://www.lsi.upc.edu/~nlp/SVMTool/SVMTool.v1.3.2.tar.gz'
  sha1 '8f11bec8558db273c7268164df2cd3b76520a1da'

  def install
    system "make install" # if this fails, try separate make/make install steps
  end

  def test
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test SVMTool.v`.
    system "false"
  end
end
