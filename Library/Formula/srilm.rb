require 'formula'

class Srilm < Formula
  homepage 'http://www-speech.sri.com/projects/srilm'
  url 'http://www-speech.sri.com/cgi-bin/uncgi/srilm.tgz?name=Homebrew Project&org=Homebrew Project&address=The Internet&url=http://mxcl.github.com/homebrew/&email=home@brew.org&file=/project/srilm/srilm-1.5.12.tar.gz', :using => :post
  md5 '026e26bc7251a1478af1591d72dba959'
  version '1.5.12'

  depends_on 'gawk'

  def install
    system "SRILM=$(PWD) make World"
    prefix.install Dir["CHANGES", "Copyright", "INSTALL", "License", "README", "RELEASE", "doc", "include", "utils"]
    bin.install Dir["bin/macosx/*", "bin/*"]
    lib.install Dir["lib/*"]
    man.install Dir["man/*"]
  end

  def test
    system "SRILM=$(PWD) make cleantest"
  end
end
