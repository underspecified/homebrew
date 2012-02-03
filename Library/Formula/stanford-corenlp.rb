require 'formula'

class StanfordCorenlp < Formula
  url 'http://nlp.stanford.edu/software/stanford-corenlp-2012-01-08.tgz'
  homepage 'http://nlp.stanford.edu/software/corenlp.shtml'
  md5 '0c5a5db07cb66b20815402ed5472dbf0'
  version '1.3.0'

  def install
    prefix.install Dir['LIBRARY-LICENSES', 'LICENSE.txt', 'README.txt', ]
    bin.install Dir['corenlp.sh']
    libexec.install Dir['CoreNLP-to-HTML.xsl', 'joda-time.jar', 'xom.jar',
			'stanford-corenlp-2012-01-08.jar', 'stanford-corenlp-2012-01-08-javadoc.jar', 
			'stanford-corenlp-2011-12-27-models.jar']
  end
end
