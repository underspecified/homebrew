require 'formula'

class Cdec < Formula
  url 'https://github.com/redpony/cdec.git'
  homepage 'http://cdec-decoder.org/'
  md5 'f036d4ec5c79db95df3470adb7cd317ff258ab7d'
  version 'master-20111015'

  depends_on "boost"
  depends_on "cmph"
  depends_on "gtest"

  def install
    system "autoreconf -ifv"
    system "./configure", "--enable-gtest=/usr/local", "--prefix=#{prefix}"
    system "make install"
  end

  def test
    # This test will fail and we won't accept that! It's enough to just
    # replace "false" with the main program this formula installs, but
    # it'd be nice if you were more thorough. Test the test with
    # `brew test cdec`. Remove this comment before submitting
    # your pull request!
    system "make test"
  end
end
