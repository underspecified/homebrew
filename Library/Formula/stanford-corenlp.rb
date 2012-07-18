require 'formula'

class StanfordCorenlp < Formula
  url 'http://nlp.stanford.edu/software/stanford-corenlp-2012-07-09.tgz'
  homepage 'http://nlp.stanford.edu/software/corenlp.shtml'
  md5 'bc34347cb5f0d58aa7c293a2f5190ff2'
  version '1.3.3'

  def install
    prefix.install Dir['LIBRARY-LICENSES', 'LICENSE.txt', 'README.txt', ]
    bin.install Dir['corenlp.sh']
    libexec.install Dir['CoreNLP-to-HTML.xsl', 'joda-time.jar', 'xom.jar',
			'stanford-corenlp-2012-07-09.jar', 'stanford-corenlp-2012-07-09-javadoc.jar', 
			'stanford-corenlp-2012-07-06-models.jar']
  end
end
