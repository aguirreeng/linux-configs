# Include EPEL repository for additional software
yum --assumeyes install epel-release

# Develpment libraries and tools
yum --assumeyes group install "Development Tools"
yum install kernel-devel.x86_64
yum install gmp.x86_64 gmp-devel.x86_64
yum install mpfr.x86_64 mpfr-devel.x86_64
yum install libmpc.x86_64 libmpc-devel.x86_64
yum install curl-devel expat-devel gettext-devel openssl-devel zlib-devel perl-CPAN perl-devel
yum install libpng.x86_64 libpng-devel.x86_64
yum install mesa-libGL.x86_64 mesa-libGL-devel.x86_64
yum install mesa-libGLU.x86_64 mesa-libGLU-devel.x86_64
yum install giflib.x86_64 giflib-devel.x86_64
yum install freeglut.x86_64 freeglut-devel.x86_64
yum install libharu.x86_64 libharu-devel.x86_64

# Visual Studio Code
rpm --import https://packages.microsoft.com/keys/microsoft.asc
sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
yum check-update
yum --assumeyes install code

