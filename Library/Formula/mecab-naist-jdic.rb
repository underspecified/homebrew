require 'formula'

class MecabNaistJdic < Formula
  url 'http://sourceforge.jp/frs/redir.php?m=iij&f=%2Fnaist-jdic%2F53500%2Fmecab-naist-jdic-0.6.3b-20111013.tar.gz'
  homepage 'http://sourceforge.jp/projects/naist-jdic/'
  md5 '52238fb14d949e49a65a9dbc1f7e382c'

  depends_on 'mecab'

  def install
    args = ["--disable-debug", "--disable-dependency-tracking", "--prefix=#{prefix}"]
    args << ARGV.find(Proc.new {"--with-charset=utf8"}) { |arg| /^--with-charset/.match(arg) }
    system "./configure", *args
    inreplace 'Makefile.am', '$(DESTDIR)', '/usr/local/Cellar/mecab/0.994'
    system "autoreconf"
    system "make install"
  end
end
