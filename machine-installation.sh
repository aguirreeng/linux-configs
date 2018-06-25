# Install and configure Anaconda
wget --directory-prefix=$HOME/Downloads https://repo.anaconda.com/archive/Anaconda3-5.2.0-Linux-x86_64.sh
echo -ne '\n' | bash $HOME/Downloads/Anaconda3-5.2.0-Linux-x86_64.sh -b -p $HOME/apps/anaconda3
cp $HOME/.bashrc $HOME/.bashrc_backup
echo "# Anaconda3 path" >> $HOME/.bashrc
echo "export PATH=\$HOME/apps/anaconda3/bin:\$PATH" >> $HOME/.bashrc
$HOME/apps/anaconda3/bin/conda config --add channels conda-forge --yes
$HOME/apps/anaconda3/bin/conda update --prefix $HOME/apps/anaconda3 anaconda --yes

# Create conda environment
$HOME/apps/anaconda3/bin/conda env create --file=$HOME/repository/linux-configs/notebook-environment.yml
mkdir -p $HOME/apps/anaconda3/envs/notebook/etc/conda/activate.d
mkdir -p $HOME/apps/anaconda3/envs/notebook/etc/conda/deactivate.d
cp $HOME/repository/linux-configs/activate-env_vars.sh $HOME/apps/anaconda3/envs/notebook/etc/conda/activate.d/env_vars.sh
cp $HOME/repository/linux-configs/deactivate-env_vars.sh $HOME/apps/anaconda3/envs/notebook/etc/conda/deactivate.d/env_vars.sh

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
