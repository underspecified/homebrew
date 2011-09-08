require 'formula'

class StanfordCorenlp < Formula
  url 'http://nlp.stanford.edu/software/stanford-corenlp-v1.1.0.tgz'
  homepage 'http://nlp.stanford.edu/software/corenlp.shtml'
  md5 'e484404af41288cfadff91ff725bf6cb'

  def install
    prefix.install Dir['*']
    libexec.install Dir['*']
  end
end
