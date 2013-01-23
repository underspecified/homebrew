require 'formula'

class Loonybin < Formula
  url 'http://downloads.sourceforge.net/project/loonybin/0.6.0-rc1/loonybin-0.6.0-rc1.tar.gz'
  homepage 'http://www.cs.cmu.edu/~jhclark/loonybin'
  md5 '8d498f81e20de2e25721afe4bd639fd5'

  def install
    prefix.install Dir["CHANGELOG", "LICENSE", "README", "TUTORIAL",
                       "LoonyBin.app", "LoonyBin*-#{version}.jar", "LoonyBin*-#{version}.sh",
                       "cachedir", "scripts", "tool-packs"]
    cd prefix
    bin.ln_sf Dir["Loonybin.app", "*.sh"]
  end
end
