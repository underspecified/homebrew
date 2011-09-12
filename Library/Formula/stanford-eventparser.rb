require 'formula'

class StanfordEventparser < Formula
  url 'http://nlp.stanford.edu/software/stanford-eventparser-v1.tgz'
  homepage 'http://nlp.stanford.edu/software/eventparser.shtml'
  md5 '4ff9cacd2cc1ffb83bd7220e97ece3b3'

  depends_on 'trove'
  depends_on 'stanford-corenlp'

  def install
    prefix.install Dir['LICENSE.txt', 'README.txt']
    libexec.install Dir['stanford-eventparser-2011-08-02.jar', '*.props']
  end
end
