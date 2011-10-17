require 'formula'

class GizaPp < Formula
  url 'http://giza-pp.googlecode.com/files/giza-pp.tgz'
  md5 'de90534b56f1cd4dfb7700797f7bffe5'
  homepage 'http://code.google.com/p/giza-pp/'
  version '1.06'

  def install
    system "make all"
    system "mv GIZA++-v2/LICENSE #{prefix}/LICENSE.GIZA++"
    system "mv GIZA++-v2/README #{prefix}/README.GIZA++"
    system "mv mkcls-v2/LICENSE #{prefix}/LICENSE.mkcls"
    system "mv mkcls-v2/README #{prefix}/README.mkcls"
    bin.install Dir["GIZA++-v2/GIZA++", "GIZA++-v2/trainGIZA++.sh", "GIZA++-v2/*.out", "mkcls-v2/mkcls"]
  end

  def test
    # This test will fail and we won't accept that! It's enough to just
    # replace "false" with the main program this formula installs, but
    # it'd be nice if you were more thorough. Test the test with
    # `brew test giza-pp`. Remove this comment before submitting
    # your pull request!
    system "false"
  end
end
