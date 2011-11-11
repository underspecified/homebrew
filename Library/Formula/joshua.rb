require 'formula'

class Joshua < Formula
  url 'https://github.com/joshua-decoder/joshua.git', :using => :git
  homepage 'http://cs.jhu.edu/~ccb/joshua/'
  md5 '300e44bace941ed758cf8f81e9141fe7e9f81603'
  version 'master-20111007'

  depends_on 'srilm'
  depends_on 'swig'

  def install
    system "JOSHUA=$(PWD) JOSHUA_HOME=$(PWD) SRILM=/usr/local/bin ant jar"
    #libexec.install Dir["bin/joshua.jar"]
    prefix.install Dir["*"]
  end

  def test
    system "JOSHUA=$(PWD) JOSHUA_HOME=$(PWD) SRILM=/usr/local/bin ant compile"
  end
end
