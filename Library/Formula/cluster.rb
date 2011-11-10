require 'formula'

class Cluster < Formula
  url 'http://bonsai.hgc.jp/~mdehoon/software/cluster/cluster-1.50.tar.gz'
  homepage 'http://bonsai.hgc.jp/~mdehoon/software/cluster/software.htm'
  md5 'f21e0c97923c04b68beb47b0a7cfe0f2'

  def install
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}", "--without-x"
    system "make install"
  end
end
