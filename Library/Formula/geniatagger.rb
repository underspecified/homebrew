require 'formula'

class Geniatagger < Formula
  url 'http://www.nactem.ac.uk/tsujii/GENIA/tagger/geniatagger-3.0.1.tar.gz'
  homepage 'http://www-tsujii.is.s.u-tokyo.ac.jp/GENIA/tagger/'
  md5 'd7cc73d996a15f73ff8535ae173d2222'

  def install
    # hardwire the path to the models
    ['main.cpp', 'morph.cpp', 'namedentity.cpp'].each { 
      |f| inreplace f, '"./', "\"#{lib}/"
    }        

    system "make geniatagger"
    lib.install Dir['models_*', 'morphdic']
    bin.install Dir['geniatagger']
  end
end
