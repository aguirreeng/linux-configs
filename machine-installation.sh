# Install and configure Anaconda
wget --directory-prefix=$HOME/Downloads https://repo.anaconda.com/archive/Anaconda3-5.2.0-Linux-x86_64.sh
echo -ne '\n' | bash $HOME/Downloads/Anaconda3-5.2.0-Linux-x86_64.sh -b -p $HOME/apps/anaconda3
cp $HOME/.bashrc $HOME/.bashrc_backup
echo "# Anaconda3 path" >> $HOME/.bashrc
echo "export PATH=\$HOME/apps/anaconda3/bin:\$PATH" >> $HOME/.bashrc
$HOME/apps/anaconda3/bin/conda config --add channels conda-forge
$HOME/apps/anaconda3/bin/conda update --prefix $HOME/apps/anaconda3 anaconda --yes

# Create conda environment
$HOME/apps/anaconda3/bin/conda env create --file=$HOME/repository/linux-configs/conda-envs/notebook-environment.yml
mkdir -p $HOME/apps/anaconda3/envs/notebook/etc/conda/activate.d
mkdir -p $HOME/apps/anaconda3/envs/notebook/etc/conda/deactivate.d
cp $HOME/repository/linux-configs/conda-envs/activate-env_vars.sh $HOME/apps/anaconda3/envs/notebook/etc/conda/activate.d/env_vars.sh
cp $HOME/repository/linux-configs/conda-envs/deactivate-env_vars.sh $HOME/apps/anaconda3/envs/notebook/etc/conda/deactivate.d/env_vars.sh

# Install Thonny
bash <(curl -s http://thonny.org/installer-for-linux)

# Install Cling
#wget --directory-prefix=$HOME/Downloads https://root.cern.ch/download/cling/cling_2017-10-11_ubuntu16.tar.bz2
#tar --extract --bzip2 --verbose --file=$HOME/Downloads/cling_2017-10-11_ubuntu16.tar.bz2 --directory=$HOME/apps
#echo "# Cling path" >> .bashrc
#echo "export PATH=\$HOME/apps/cling_2017-10-11_ubuntu16/bin:\$PATH" >> .bashrc

# Install Cling kernel to Jupyter
#pip install -e $HOME/apps/cling_2017-10-11_ubuntu16/share/cling/Jupyter/kernel/
#$HOME/apps/anaconda3/envs/notebook/bin/jupyter-kernelspec install --user $HOME/apps/cling_2017-10-11_ubuntu16/share/cling/Jupyter/kernel/cling-cpp11
#$HOME/apps/anaconda3/envs/notebook/bin/jupyter-kernelspec install --user $HOME/apps/cling_2017-10-11_ubuntu16/share/cling/Jupyter/kernel/cling-cpp14
#$HOME/apps/anaconda3/envs/notebook/bin/jupyter-kernelspec install --user $HOME/apps/cling_2017-10-11_ubuntu16/share/cling/Jupyter/kernel/cling-cpp17
#source $HOME/apps/anaconda3/envs/notebook/bin/deactivate

# Install Visual Studio Code C++ extensions
code --install-extension ms-vscode.cpptools
code --install-extension bbenoist.Doxygen
code --install-extension matthewferreira.cppcheck
code --install-extension twxs.cmake
code --install-extension vector-of-bool.cmake-tools
code --install-extension kriegalex.vscode-cudacpp

# Install Visual Studio Code Markdown extensions
code --install-extension bierner.emojisense
code --install-extension bierner.markdown-checkbox
code --install-extension bierner.markdown-emoji
code --install-extension bierner.markdown-footnotes
code --install-extension bierner.markdown-mermaid
code --install-extension DavidAnson.vscode-markdownlint
code --install-extension geeklearningio.graphviz-markdown-preview
code --install-extension goessner.mdmath
code --install-extension swiftstudios.insert-special-symbol

# Install Visual Studio Code Python extensions
code --install-extension ms-python.python

#  Install Visual Studio Code LaTeX extensions
code --install-extension James-Yu.latex-workshop

