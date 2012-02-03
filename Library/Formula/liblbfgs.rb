require 'formula'

class Liblbfgs < Formula
  url 'http://www.chokkan.org/software/dist/liblbfgs-1.8.tar.gz'
  homepage 'http://www.chokkan.org/software/liblbfgs/'
  md5 '77c92ca4ec4225e2d8f2d562ecb9a00e'

  def install
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make install"
  end
end
