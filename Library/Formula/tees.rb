require 'formula'

class Tees < Formula
  url 'http://bionlp.utu.fi/static/event-extractor/TurkuEventExtractionSystem-1.01.zip'
  homepage 'http://bionlp.utu.fi/eventextractionsoftware.html'
  md5 '211b382be3980616163f571f9111e8b8'

  # depends_on 'cmake'

  def install
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    # system "cmake . #{std_cmake_parameters}"
    system "make install"
  end

  def test
    # this will fail we won't accept that, make it test the program works!
    system "/usr/bin/false"
  end
end
