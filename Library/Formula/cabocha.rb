require 'formula'

class Cabocha < Formula
  version '0.60'
  url 'http://cabocha.googlecode.com/files/cabocha-0.60.tar.gz'
  homepage 'http://code.google.com/p/cabocha/'
  sha1 '3792c486cbe06d998bd1b749f10f5f2803f8ff60'

  depends_on 'crfpp'
  depends_on 'mecab'

  def install
    ENV['LIBS']='-liconv'
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}", "--enable-utf8-only"
    system "make install"
  end
end
