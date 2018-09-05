#! /bin/bash

DEBIAN_FRONTEND=noninteractive

# update packages
sudo apt-get update

# Add GPUs
# https://cloud.google.com/compute/docs/gpus/add-gpus

# This sample script checks for an existing CUDA install 
# and then installs the full CUDA 9 package and its associated proprietary driver.

echo "Checking for CUDA and installing."
# Check for CUDA and try to install.
if ! dpkg-query -W cuda-9-0; then
  # The 16.04 installer
  curl -O http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/cuda-repo-ubuntu1604_9.0.176-1_amd64.deb
  sudo dpkg -i ./cuda-repo-ubuntu1604_9.0.176-1_amd64.deb
  sudo apt-key adv --fetch-keys http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/7fa2af80.pub
  sudo apt-get update
  sudo apt-get install cuda-9-0 -y
fi

# Enable persistence mode
sudo nvidia-smi -pm 1

# install cuDNN v7.0
# file hosted on fast.ai servers
wget http://files.fast.ai/files/cudnn-9.1-linux-x64-v7.tgz
sudo tar -xzvf cudnn-9.1-linux-x64-v7.tgz
sudo cp cuda/include/cudnn.h /usr/local/cuda/include
sudo cp cuda/lib64/libcudnn* /usr/local/cuda/lib64
sudo chmod a+r /usr/local/cuda/include/cudnn.h /usr/local/cuda/lib64/libcudnn*

# Install python pakages
sudo apt-get -y install ipython
sudo apt-get -y install python3-pip
sudo pip3 install numpy scipy matplotlib ipython jupyter pandas

# Install other useful/required Packages
sudo apt-get -y install git python-dev python3-dev python-numpy python3-numpy python-six python3-six build-essential 
sudo apt-get -y install python-pip python3-pip python-virtualenv swig python-wheel python3-wheel libcurl3-dev libcupti-dev

# Add the Cuda file to .bashrc
echo 'export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/local/cuda/lib64:/usr/local/cuda/extras/CUPTI/lib64"' >> ~/.bashrc
echo 'export CUDA_HOME=/usr/local/cuda' >> ~/.bashrc
source ~/.bashrc

# Upgrade the pip install
sudo pip3 install -U pip

# Install TensorFlow - https://www.tensorflow.org/install/install_linux#InstallingNativePip
# option 1: tensorflow —Current release for CPU 
# option 2: tensorflow-gpu —Current release with GPU support
# option 3: tf-nightly —Nightly build for CPU
# option 4: tf-nightly-gpu —Nightly build with GPU support
sudo pip3 install -U tensorflow-gpu

# Test the installation
python3 -c "import tensorflow as tf; print(tf.__version__)"