require 'formula'

class Reverb < Formula
  url 'http://reverb.cs.washington.edu/reverb-1.0.tar.gz'
  homepage 'http://reverb.cs.washington.edu/'
  md5 'a2242a5042d4e2e9617db473a425f086'

  depends_on 'coreutils'

  def install
    inreplace Dir['reverb.sh'] do |s| 
       #s.gsub! /lib/, 'libexec'
       s.gsub! /`dirname \$0`/, '"$(greadlink -f $(dirname $(greadlink -f $(which reverb.sh))))/.."'
    end

    bin.install Dir['reverb.sh']
    #libexec.install Dir['lib/*']
    prefix.install Dir['*']

    #bin.mkdir
    #Dir["#{prefix}/reverb.sh"].each do |f|
      #ln_s f, bin+File.basename(f)
    #end
  end
end
