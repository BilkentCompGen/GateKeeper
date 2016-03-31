# **GateKeeper: A New Streaming Accelerator Architecture for Fast Pre-Alignment in DNA Short Read Mapping**

## Abstract:
Genome analysis helps to reveal the genomic variants that cause diseases and evolution of species. However, high throughput DNA sequencing (HTS) technologies generate excessive number of small DNA segments -called short reads- that incur significant computational burden. To analyze the entire genome, each of the billions of short reads needs to be mapped to a reference genome through a computationally expensive process. Due to sequencing errors and genomic variants, the similarity measurement between a read and “candidate” locations in the reference genome, called alignment, is formulated as an approximate string-matching problem, which is solved using quadratic-time dynamic programming algorithms. In practice, the majority of candidate locations are unverifiable, i.e., the alignment carries more errors than typically allowed. This imposes a huge computational burden as their verification wastes most of the mapper’s execution time. 
## Result:
To tackle this problem, we propose GateKeeper, a new hardware architecture that functions as a pre-alignment step. The main idea of our design is to filter out the incorrect mappings in a streaming fashion using Field-Programmable Gate Arrays (FPGAs). By excluding the incorrect mappings at an early stage, we reduce the number of candidate verifications in the rest of the execution, and thus accelerate the read mapping process. We introduce the first design to accelerate pre-alignment using new technologies. Our design on a single FPGA chip shows up to 17.3-fold speedup over the state-of-the-art read mapping filters. Our algorithm demonstrates up to two orders of magnitude speedup over other hardware-accelerated mapping tools such as BWA and BFAST.


***

## Running a test:
To run a test using GateKeeper, you need to prepare the following:
1. Computer that supports PCIe Gen3 4-lane.
2. Virtex®-7 FPGA VC709 Connectivity Kit.
3. Vivado v2014.4 (64-bit).
4. Ubuntu 14.4.
5. Genomic read dataset in ACGT format.

Simply, Synthesize and Implement the source code using Vivado, then generate a bitstream file (.bit). Program your VC709 board with the generated file. Run the host application using the following command:
`./GateKeeper 512 output.out`
