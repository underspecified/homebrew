require 'formula'

class Cmph < Formula
  url 'http://downloads.sourceforge.net/project/cmph/cmph/cmph-1.1/cmph-1.1.tar.gz'
  homepage 'http://cmph.sourceforge.net/'
  md5 '1fe87e14b60e7d71f829417448516861'

  # depends_on 'cmake'

  def install
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make install"
  end
    
  def test
    system "make test"
  end
end
