require 'formula'

class MecabNaistJdic < Formula
  url 'http://sourceforge.jp/frs/redir.php?f=%2Fnaist-jdic%2F48487%2Fmecab-naist-jdic-0.6.3-20100801.tar.gz'
  homepage 'http://sourceforge.jp/projects/naist-jdic/'
  md5 '30af2251331b9d6141748caf033821e3'

  depends_on 'mecab'

  def install
    args = ["--disable-debug", "--disable-dependency-tracking", "--prefix=#{prefix}"]
    args << ARGV.find(Proc.new {"--with-charset=utf8"}) { |arg| /^--with-charset/.match(arg) }
    system "./configure", *args
    inreplace 'Makefile.am', '$(DESTDIR)', '/usr/local/Cellar/mecab/0.98'
    system "/usr/bin/autoreconf"
    system "make install"
  end
end
