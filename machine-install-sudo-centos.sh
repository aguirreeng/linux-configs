# Include EPEL repository for additional software
yum install epel-release --assumeyes

# Develpment libraries and tools
#yum  group install "Development Tools" --assumeyes
#yum  install kernel-devel.x86_64 --assumeyes
#yum install gmp.x86_64 gmp-devel.x86_64 --assumeyes
#yum install mpfr.x86_64 mpfr-devel.x86_64 --assumeyes
#yum install libmpc.x86_64 libmpc-devel.x86_64 --assumeyes
#yum install curl-devel expat-devel gettext-devel openssl-devel zlib-devel perl-CPAN perl-devel --assumeyes
#yum install libpng.x86_64 libpng-devel.x86_64 --assumeyes
#yum install mesa-libGL.x86_64 mesa-libGL-devel.x86_64 --assumeyes
#yum install mesa-libGLU.x86_64 mesa-libGLU-devel.x86_64 --assumeyes
#yum install giflib.x86_64 giflib-devel.x86_64 --assumeyes
#yum install freeglut.x86_64 freeglut-devel.x86_64 --assumeyes
#yum install libharu.x86_64 libharu-devel.x86_64 --assumeyes

# Visual Studio Code
rpm --import https://packages.microsoft.com/keys/microsoft.asc
sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
yum check-update --assumeyes
yum install code --assumeyes

