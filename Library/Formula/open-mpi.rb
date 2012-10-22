require 'formula'

class OpenMpi < Formula
  homepage 'http://www.open-mpi.org/'
  url 'http://www.open-mpi.org/software/ompi/v1.6/downloads/openmpi-1.6.2.tar.bz2'
  sha1 '694fd3bac911cdb22f77175884d819b6fea871df'

  # Reported upstream at version 1.6, both issues
  # http://www.open-mpi.org/community/lists/devel/2012/05/11003.php
  # http://www.open-mpi.org/community/lists/devel/2012/08/11362.php
  fails_with :clang do
    build 421
    cause 'fails make check on Lion and ML'
  end

  option 'disable-fortran', 'Do not build the Fortran bindings'
  option 'test', 'Verify the build with make check'

  def install
    args = %W[
      --prefix=#{prefix}
      --disable-dependency-tracking
      --enable-ipv6
    ]
    if build.include? 'disable-fortran'
      args << '--disable-mpi-f77' << '--disable-mpi-f90'
    else
      ENV.fortran
    end

    system './configure', *args
    system 'make all'
    system 'make check' if build.include? 'test'
    system 'make install'

    # If Fortran bindings were built, there will be a stray `.mod` file
    # (Fortran header) in `lib` that needs to be moved to `include`.
    mv "#{lib}/mpi.mod", include if File.exists? "#{lib}/mpi.mod"

    mv "#{bin}/vtsetup.jar", libexec
    (bin+'vtsetup.jar').write <<-EOS.undent
      #!/bin/bash
      java -jar "#{libexec}/vtsetup.jar" "$@"
    EOS
  end
end
