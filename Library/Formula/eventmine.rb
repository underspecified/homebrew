require 'formula'

class Eventmine < Formula
  url 'http://www-tsujii.is.s.u-tokyo.ac.jp/~mmiwa/EventMine/EventMine-0.1.tar.gz'
  homepage 'http://www-tsujii.is.s.u-tokyo.ac.jp/~mmiwa/EventMine/'
  md5 'f8f3ab4945958489c956dc5dc9f25c88'

  def install
    inreplace 'Makefile' do |s| 
      #s.remove_make_var! %w[CFLAGS LDFLAGS CC LD]
      s.change_make_var! "TOOLS", "/usr/local/bin/geniass /usr/local/bin/gdep"
    end
    system "make install"
  end
end
