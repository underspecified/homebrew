require 'formula'

class Enju < Formula
  url 'http://www-tsujii.is.s.u-tokyo.ac.jp/downloads/downloads.cgi'
  homepage ''
  md5 'a0663d679bfafe7694422e1025cc5238'

  # depends_on 'cmake'

  def install
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    # system "cmake . #{std_cmake_parameters}"
    system "make install"
  end
end
