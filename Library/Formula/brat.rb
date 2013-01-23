require 'formula'

# Documentation: https://github.com/mxcl/homebrew/wiki/Formula-Cookbook
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Brat < Formula
  homepage 'http://brat.nlplab.org/'
  url 'http://weaver.nlplab.org/~brat/releases/brat-v1.1p1_Albatross.tar.gz'
  md5 '27d442bb2bddf21f924726a7ff53ba64'
  version '1.1p1_Albatross'

  def install
    system "bash install.sh"
  end

  def test
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test brat`.
    system "false"
  end
end
