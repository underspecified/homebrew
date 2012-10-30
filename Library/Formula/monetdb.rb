require 'formula'

class Monetdb < Formula
  homepage 'http://www.monetdb.org/'
  url 'http://dev.monetdb.org/downloads/sources/Oct2012/MonetDB-11.13.3.tar.bz2'
  sha1 'b414d85f49463b0d46da1275bc91f166c302d50d'

  head 'http://dev.monetdb.org/hg/MonetDB', :using => :hg

  depends_on 'pkg-config' => :build
  depends_on 'pcre'
  depends_on 'readline' # Compilation fails with libedit.

  def install
    system "./bootstrap" if build.head?

    system "./configure", "--prefix=#{prefix}",
                          "--enable-debug=no",
                          "--enable-assert=no",
                          "--enable-optimize=yes",
                          "--enable-testing=no",
                          "--disable-jaql",
                          "--without-rubygem"
    system "make install"
  end
end
