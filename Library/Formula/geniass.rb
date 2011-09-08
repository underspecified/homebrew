require 'formula'

class Geniass < Formula
  url 'http://www-tsujii.is.s.u-tokyo.ac.jp/~y-matsu/geniass/geniass-1.00.tar.gz'
  homepage 'http://www-tsujii.is.s.u-tokyo.ac.jp/~y-matsu/geniass/'
  md5 '5b437369bdc4766a1daf162754a61a5d'

  def install
    system "make"
    lib.install Dir['geniass', 'makeMapping', 'remapStandOff', 'model*-*', '*.rb', '*.sh']
    bin.mkpath
    Dir["#{lib}/geniass", "#{lib}/makeMapping" "#{lib}/remapStandOff",
        "#{lib}/*.rb", "#{lib}/*.sh"].each { |f| ln_s f, bin }
  end
end
