require 'formula'

class StanfordCorenlp < Formula
  url 'http://nlp.stanford.edu/software/stanford-corenlp-v1.1.0.tgz'
  homepage 'http://nlp.stanford.edu/software/corenlp.shtml'
  md5 'e484404af41288cfadff91ff725bf6cb'

  def install
    prefix.install Dir['LIBRARY-LICENSES', 'LICENSE.txt', 'README.txt', ]
    libexec.install Dir['CoreNLP-to-HTML.xsl', 'fastutil.jar', 'jgraph.jar', 'jgrapht.jar', 'xom.jar',
			'stanford-corenlp-2011-06-19.jar', 'stanford-corenlp-models-2011-06-19.jar']
  end
end
