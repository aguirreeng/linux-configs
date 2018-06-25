# Essentials to C++
apt install build-essential --yes
apt install cmake --yes
apt install curl --yes
apt install thonny --yes

# Install FreeCAD 
#add-apt-repository ppa:freecad-maintainers/freecad-stable
#apt-get update
#apt install freecad --yes

# Install Visual Studio Code
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > $HOME/Downloads/microsoft.gpg
mv $HOME/Downloads/microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
apt update
apt install code --yes

