require 'formula'

class SvmLight < Formula
  version '6.02'
  url 'http://download.joachims.org/svm_light/current/svm_light.tar.gz'
  homepage 'http://download.joachims.org/svm_light/'
  md5 '59768adde96737b1ecef123bc3a612ce'

  def install
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make install"
  end
end
