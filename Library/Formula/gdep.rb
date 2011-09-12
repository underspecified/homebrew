require 'formula'

class Gdep < Formula
  url 'http://people.ict.usc.edu/~sagae/parser/gdep/gdep-beta2.tgz'
  homepage 'http://people.ict.usc.edu/~sagae/parser/gdep/'
  md5 '6e920725cc9fe00a24bb1fa57fa5a3ac'
  version 'beta2'

  def install
    # hardwire the path to the models
    ['ksdep.cpp', 'main.cpp', 'morph.cpp', 'namedentity.cpp'].each { |f| 
      inreplace f, '"./', "\"#{lib}/"
      inreplace f, "genia.mod", "#{lib}/genia.mod"
    }

    system "make gdep"
    bin.install Dir['gdep']
    #lib.install Dir['genia.mod', 'models_*', 'morphdic']
    lib.install Dir['*']
  end
end
