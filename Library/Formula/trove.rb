require 'formula'

class Trove < Formula
  url 'http://sourceforge.net/projects/trove4j/files/trove/archived/trove-2.0.4/trove-2.0.4.tar.gz'
  homepage 'http://trove.starlight-systems.com/'
  md5 '92cb2b423fb9ed9d8506a1b7fa4932b4'

  def install
    prefix.install Dir['*.txt', 'javadocs']
    libexec.install Dir['lib/junit.jar', 'lib/trove-2.0.4.jar']
  end
end
