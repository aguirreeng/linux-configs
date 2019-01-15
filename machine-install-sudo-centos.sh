# Include EPEL repository for additional software
yum install epel-release --assumeyes

# Develpment libraries and tools
yum  group install "Development Tools" --assumeyes
yum  install kernel-devel.x86_64 --assumeyes

# Visual Studio Code
rpm --import https://packages.microsoft.com/keys/microsoft.asc
sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
yum check-update --assumeyes
yum install code --assumeyes

