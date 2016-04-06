# **GateKeeper: Enabling Fast Pre-Alignment in DNA Short Read Mapping with a New Streaming Accelerator Architecture**

## Motivation:
Genome analysis helps to reveal the genomic variants that cause diseases and evolution of species. Unfortunately, high throughput DNA sequencing (HTS) technologies generate excessive number of small DNA segments -called short reads- that incur significant computational burden. To analyze the entire genome, each of the billions of short reads must be mapped to a reference genome through a computationally expensive process. Due to sequencing errors and genomic variants, the similarity measurement between a read and “candidate” locations in the reference genome, called alignment, is formulated as an approximate string-matching problem, which is solved using quadratic-time dynamic programming algorithms. In practice, the majority of candidate locations do not align with a given read due to high dissimilarity. The verification process of such candidate locations occupies most of a modern read mapper’s execution time. 
## Result:
We propose GateKeeper, a new architecture that functions as a pre-alignment step that quickly filters out most incorrect candidate locations. The main idea of GateKeeper is to filter out the incorrect mappings in a streaming fashion using Field-Programmable Gate Arrays (FPGAs). By excluding the incorrect mappings at an early stage, we reduce the number of candidate verifications in the rest of the execution, and thus accelerate the read mapping. GateKeeper is the first design to accelerate pre-alignment using new hardware technologies. On a single FPGA chip, it provides up to 17.3-fold speedup over the state-of-the-art pre-alignment technique, SHD. GateKeeper can provide more than two orders of magnitude speedup over other hardware-accelerated mapping tools such as BWA and BFAST. 


***

## Running a test:
To run a test using GateKeeper, you need to prepare the following:
1. Computer that supports PCIe Gen3 4-lane.
2. Virtex®-7 FPGA VC709 Connectivity Kit.
3. Vivado v2014.4 (64-bit).
4. Ubuntu 14.4.
5. Genomic read dataset in ACGT format.

GateKeeper design requires no user IP configuration and generation. The design also includes pre-compiled bit-file in
```GateKeeper\FPGA Application\GateKeeper_VC709.bit```
Simply, Download the bitstream file and program your VC709 board. For advanced users: you can run a new synthesise and implementation using the Vivado project in ```GateKeeper\FPGA Application\VC709_Gen3x4If128\GateKeeper.xpr``` We highly recommend using Vivado 2014.4. 
Run the host application provided in ```GateKeeper\Host Application\GateKeeper_test.cpp``` using the following command:

```
$ ./GateKeeper_test [INPUT_SIZE_IN_BYTES] [OUTPUT_FILE_NAME]
$ ./GateKeeper_test [INPUT_FILE_NAME] [OUTPUT_FILE_NAME]
```
The size argument should be a positive integer!
You can verify if your VC709 board is configured correctly and reachable through your PCIe using the following command:

```
sudo lspci -vvv -d 10EE:*
```


***

## How to install Vivado on UBUNTU?
*give root permissions to the current username
```
$ pkexec visudo
*then add: 
$ alser ALL=(ALL:ALL) ALL
*after this line: $ root ALL=(ALL:ALL) ALL
```

*create folder in home to install xilinx inside it
```
$ sudo mkdir /home/Xilinx
$ sudo chmod 777 /home/Xilinx
$ sudo ln -s /home/Xilinx /opt/Xilinx
```

*install xilinx
```
$ cd /home/alser/Downloads/Xilinx_Vivado_SDK_Lin_2014.2_0626_1 
$ sudo chmod +x ./xsetup
$ sudo chmod +x /home/alser/Downloads/Xilinx_Vivado_SDK_Lin_2014.2_0626_1/tps/lnx64/jre/bin
$ sudo ./xsetup 
```
*change the Admin permission, alser is a username
```
$ sudo chgrp -R alser .Xilinx
$ sudo chown -R alser .Xilinx

$ sudo chgrp -R alser /home/Xilinx
$ sudo chown -R alser /home/Xilinx
```
*install the drivers
```
$ cd /home/Xilinx/Vivado/2014.2/data/xicom/cable_drivers/lin64/install_script/install_drivers/
$ sudo /home/Xilinx/Vivado/2014.2/data/xicom/cable_drivers/lin64/install_script/install_drivers/install_drivers
```
*prepare the environment and create alias to start vivado
```
$ sudo gedit .bashrc
```
*then add to the end of the output file:
(you may or not need this line, but try first without it)
```
$ export XILINXD_LICENSE_FILE=/home/alser/.Xilinx/Xilinx.lic
$ alias vivado='source /home/Xilinx/Vivado/2014.2/settings64.sh && vivado'
```
*to start vivado type in the terminal: 
```
$ vivado
````
