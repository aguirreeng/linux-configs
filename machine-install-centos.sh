# Install and configure Miniconda
wget --directory-prefix=$HOME/Downloads https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh 
echo -ne '\n' | bash $HOME/Downloads/Miniconda3-latest-Linux-x86_64.sh -b -p $HOME/apps/miniconda
cp $HOME/.bashrc $HOME/.bashrc_install_backup
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

# Thonny
echo -ne '\ny\n' | bash <(curl -s http://thonny.org/installer-for-linux)
echo "# Thonny path" >> $HOME/.bashrc
echo "export PATH=\$HOME/apps/thonny/bin:\$PATH" >> $HOME/.bashrc

