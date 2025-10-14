# VLSI_ARM
FPGA design with ARM cortex in Arty-A7-100T


Custom ARM Cortex‑M3 Firmware on Arty A7‑100T
Project Overview
This project demonstrates how to run custom program on the Arty A7‑100T FPGA board using the ARM Cortex‑M3 softcore from the ARM DesignStart FPGA-Xilinx edition. The design can use ITCM, DTCM and optionally added  Xilinx XPM memories as memory regions for program and data storage. Vivado 2022.1 is used for FPGA hardware synthesis, implementation, and bitstream generation.

Firmware is developed and built using ARM Keil MDK with ARM Compiler version 5, required to compile legacy DesignStart projects.

Tools Used
Vivado 2022.1: FPGA design, implementation, and bitstream generation.

ARM Keil MDK with ARM Compiler v5: Firmware development, build, and debug.

Xilinx SDK (optional): For automatic generation of hardware configuration headers and BSP.

SDK Workspace and Peripheral Headers
Xilinx SDK or Vitis auto-generates essential header files (e.g., xparameters.h, xstatus.h) describing peripheral base addresses and hardware configuration.

If these files are missing, you can copy an existing compatible sdk_workspace (example: akashpatil98/ARM_DesignStart_FPGA sdk_workspace) to your software directory.

Any changes or additions to peripherals in Vivado require modifying the parameter files accordingly or regenerating these files by exporting hardware and creating a new Board Support Package (BSP) in Xilinx SDK to keep definitions synchronized.

Compiler Version and Code Fixes
ARM Compiler v5 is mandatory and must be installed inside the Keil installation directory (Keil_v5/ARM/ARMCC/).

To fix “inline function” related compilation errors with ARM Compiler 5, add this at the top of your main.c:

#ifndef inline
  #define inline __inline
#endif

This macro maps the standard inline keyword to the compiler’s expected __inline version.

Fix any other missing macros or definitions as needed for your build environment.


Building Firmware and Generating Hex File
Build your code in Keil MDK, which produces .axf and .hex files under the AT426-BU-98000-r0p1-00rel0/software/m3_for_arty_a7/Build_Keil/objects

The raw Keil-generated .hex file is not compatible for FPGA memory initialization.

Use the provided make_hex_a7.bat script or the fromelf utility to convert the .axf into a proper Intel HEX file produced in the build_keil/ directory.
. CHANGE THE LCOATION OF THE FROMELF LOCATION ACCORDING TO THE LOCATION WHERE YOU DOWLOAD THE ARM COMPILER (EG: C:\Keil_v5\ARM\ARM_Compiler_5.06u7\bin\fromelf.exe") The hex file needed for memory initialzation will automatically form in Build_keil Folder once "make_hex_a7.bat" is executed automatically after program is build

This properly formatted HEX file (bram_a7.hex) is used by Vivado for ITCM memory initialization.

FPGA Bitstream Generation and Loading Firmware
Copy the correctly formatted HEX file into your Vivado project directory.

Load the HEX file into the ITCM memory using Vivado IP configurator.

Generate an updated bitstream embedding this firmware.

Program the Arty A7‑100T FPGA with the new bitstream.

Confirm firmware functionality of your own code (Provided Main.c Produces Hello world via uart baud rate 115200)

Important Notes
Always modify parameter files or regenerate the SDK BSP files if you modify the FPGA hardware design to keep peripheral addresses in sync.

ARM Compiler version 5 is required for the legacy DesignStart firmware; other modern compilers will require code changes.

Use the dedicated HEX conversion process (fromelf via batch scripts) to ensure compatible memory initialization files.

NOTE :

https://youtu.be/Gh8mqKlYOW4 to install ARM COMPILER SUITABLE VERSION CHECK THIS LINK


![alt text](http://url/to/img.png)


