require 'formula'

class Newlisp < Formula
  homepage 'http://www.newlisp.org/'
  url 'http://www.newlisp.org/downloads/newlisp-10.4.4.tgz'
  sha1 'eb1121aa49e5ef208855bd1ffdc3204eab974169'

  depends_on 'readline'

  def install
    # Required to use our configuration
    ENV.append_to_cflags "-DNEWCONFIG -c"

    system "./configure-alt", "--prefix=#{prefix}", "--mandir=#{man}"
    system "make"
    system "make check"
    system "make install"
  end

  def caveats; <<-EOS.undent
    If you have brew in a custom prefix, the included examples
    will need to be be pointed to your newlisp executable.
    EOS
  end

  # Use the IDE to test a complete installation
  def test
    system "#{bin}/newlisp-edit"
  end
end
