# Install and configure Miniconda
wget --directory-prefix=$HOME/Downloads https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh 
echo -ne '\n' | bash $HOME/Downloads/Miniconda3-latest-Linux-x86_64.sh -b -p $HOME/apps/miniconda
cp $HOME/.bashrc $HOME/.bashrc_backup
echo "# Miniconda path" >> $HOME/.bashrc
echo "export PATH=\$HOME/apps/miniconda/bin:\$PATH" >> $HOME/.bashrc
$HOME/apps/miniconda/bin/conda config --add channels conda-forge
$HOME/apps/miniconda/bin/conda update --prefix $HOME/apps/miniconda conda --yes
$HOME/apps/miniconda/bin/conda update --prefix $HOME/apps/miniconda --all --yes

# Create conda environment
$HOME/apps/miniconda/bin/conda env create --file=$HOME/repository/linux-configs/conda-envs/notebook-environment.yml
mkdir -p $HOME/apps/miniconda/envs/notebook/etc/conda/activate.d
mkdir -p $HOME/apps/miniconda/envs/notebook/etc/conda/deactivate.d
cp $HOME/repository/linux-configs/conda-envs/activate-env_vars.sh $HOME/apps/miniconda/envs/notebook/etc/conda/activate.d/env_vars.sh
cp $HOME/repository/linux-configs/conda-envs/deactivate-env_vars.sh $HOME/apps/miniconda/envs/notebook/etc/conda/deactivate.d/env_vars.sh

# Install Cling
wget --directory-prefix=$HOME/Downloads https://root.cern.ch/download/cling/cling_2018-08-22_ubuntu17.10.tar.bz2
tar --extract --bzip2 --verbose --file=$HOME/Downloads/cling_2018-08-22_ubuntu17.10.tar.bz2 --directory=$HOME/apps
echo "# Cling path" >> $HOME/.bashrc
echo "export PATH=\$HOME/apps/cling_2018-08-22_ubuntu17.10/bin:\$PATH" >> $HOME/.bashrc

# Install Cling kernel to Jupyter
source $HOME/apps/miniconda/bin/activate notebook
pip install -e $HOME/apps/cling_2018-08-22_ubuntu17.10/share/cling/Jupyter/kernel/
$HOME/apps/miniconda/envs/notebook/bin/jupyter-kernelspec install --user $HOME/apps/cling_2018-08-22_ubuntu17.10/share/cling/Jupyter/kernel/cling-cpp11
$HOME/apps/miniconda/envs/notebook/bin/jupyter-kernelspec install --user $HOME/apps/cling_2018-08-22_ubuntu17.10/share/cling/Jupyter/kernel/cling-cpp14
$HOME/apps/miniconda/envs/notebook/bin/jupyter-kernelspec install --user $HOME/apps/cling_2018-08-22_ubuntu17.10/share/cling/Jupyter/kernel/cling-cpp17
$HOME/apps/miniconda/envs/notebook/bin/jupyter-kernelspec install --user $HOME/apps/cling_2018-08-22_ubuntu17.10/share/cling/Jupyter/kernel/cling-cpp1z
source $HOME/apps/miniconda/bin/deactivate