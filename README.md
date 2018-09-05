# basic_deeplearning_machine
### Basic **Deep Learning Machine** bash and docker setup for *TensorFlow, PyTorch, and jupyter notebook*


#### prerequisites:
* Ubuntu 16.04  installed (automated installation for newer version of Ubuntu will be comming soon)
* Nvidia compatible GPU 
-----------
#

#### List of bash scripts:
```
# Automatically installs GPU driver, CUDA 9.0, cuDNN 7.0, and Python packages
# This is useful when you want to install other deep learning framework or a specific version on top of CUDA and cuDNN 
basic_deeplearning_machine.sh

# Automatically installs TensorFlow on top of CUDA and cuDNN (Python packages are included)
cuda_with_compiled_tensorflow.sh

# Automatically builds TensorFlow from source (Python packages are included)
cuda_with_tensorflow_building_from_source.sh
```

#### Instructions:

**1. Clone/download this project on your machine (or remote virtual machine)**
**2. Run the following command in the command line to make any of the scripts executable** 

```console
chmod +x [script-name].sh
```
**3.Run the following commmand to execute the bash script**

```console
./[script-name].sh
```
**4. _"cuda_with_tensorflow_building_from_source.sh"_ asks the user for TensorFlow configuration before the compilation steps**

**Automated Steps:**

* Instal bazel to compile TensorFlow => in this step you will be asked to accept the terms and condition for JDK.

> While installing Java to instal Bazel you will be promted to accpt terms and conditions.
> 
> ![java1](/images/java_binary_1.png)
> 
> Hit enter to accept the License terms.
> 
> ![java2](/images/java_binary_2.png)
> 
> Select Yes and hit enter to accept Oracle binary code License terms.

* Building TensorFlow from source. => in this step you will be asked to set different parameters in TensofFlow ("./configure") before starting the compilation.   

