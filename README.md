# basic_deeplearning_machine
### Basic **Deep Learning Machine** bash and docker setup for *TensorFlow, PyTorch, and jupyter notebook*


#### prerequisites:
* Ubuntu 16.04  installed (automated installation for newer version of Ubuntu will be comming soon)
* Nvidia compatible GPU 
-----------


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

#
* Building TensorFlow from source. => in this step you will be asked to set different parameters in TensofFlow ("./configure") before starting the compilation.   


> Before TensorFlow compilation gets started, you will be prompted to set the configuration (add or remove of supporting of other frameworks).  This could effect the compilation time. 
> 
> 1. you will be asked to specify the location of Python on your machine.
> 
> ![tf1](/images/tf1.png)
> ```
> on most machines:   /usr/bin/python or /usr/bin/python3.5 or etc
> ```
> 2. then you will be asked to specifiy the path to python libraries.
> 
> ![ft2](/images/tf2.png)
> ```
> default is: /usr/local/lib/python3.5/dist-packages
> ```
> 3. After you specify that, you will be asked to choose for your TensorFlow to support or do not support many FrameWorks and Services.  
> **For more information visit TensorFlow installation Page here: [TensorFlow](https://www.tensorflow.org/install/install_sources)**
> 
> EXAMPLE: (If you hit enter you will choose the default values.)
> 
>![tf3](/images/tf3.png)
> 
> 
>4. Make sure you choose the right version of CUDA and cuDNN.
>
> ![tf4](/images/tf4.png)
>5. Then you will asked to choose NCCL version. Since, V-2.2 is not installed. Choose V-1.3.5 or lookup how to install V-2.2. Latest version contains performance improvement on multiple GPU jobs.
>
>![tf5](/images/tf5.png)
>6. After you finish *step-5* the compilation will start.  It could take around few minutes to a couple of hours depending on how fast is your CPU, RAM, and hard drive.
>
>![tf6](/images/tf6.png)
>