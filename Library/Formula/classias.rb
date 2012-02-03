require 'formula'

class Classias < Formula
  url 'http://www.chokkan.org/software/dist/classias-1.1.tar.gz'
  homepage 'http://www.chokkan.org/software/classias/usage.html.en'
  md5 '6dca82e3576d58e77b923f01392e1547'

  depends_on 'liblbfgs'

  def install
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make install"
  end
end
