# gcc-8.2.0
# Install necessary tools.
yum install gperf.x86_64 dejagnu autogen.x86_64 texinfo.x86_64 --assumeyes
# Install dependencies.
yum install glibc.x86_64 glibc-devel.x86_64 glibc-headers.x86_64 glibc.i686 glibc-devel.i686 --assumeyes
yum install libgnat.i686 libgnat.x86_64 libgnat-devel.i686 libgnat-devel.x86_64 gcc-gnat.x86_64 --assumeyes
yum install gmp.x86_64 gmp-devel.x86_64 gmp.i686 gmp-devel.i686 --assumeyes
yum install mpfr.x86_64 mpfr-devel.x86_64 mpfr.i686 mpfr-devel.i686 --assumeyes
yum install libmpc.x86_64 libmpc-devel.x86_64 libmpc.i686 libmpc.x86_64 --assumeyes

