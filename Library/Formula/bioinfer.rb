require 'formula'

class Bioinfer < Formula
  url 'http://www.it.utu.fi/BioInfer/files/BioInfer_software_1.0.1.zip'
  homepage 'http://mars.cs.utu.fi/BioInfer/'
  md5 '72f86d475da208ae53403f37420f682e'

  # depends_on 'cmake'

  def install
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    # system "cmake . #{std_cmake_parameters}"
    system "make install"
  end

  def test
    # this will fail we won't accept that, make it test the program works!
    system "/usr/bin/false"
  end
end
