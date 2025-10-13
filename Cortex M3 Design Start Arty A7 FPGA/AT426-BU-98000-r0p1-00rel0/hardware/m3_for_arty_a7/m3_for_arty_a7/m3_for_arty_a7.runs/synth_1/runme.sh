#!/bin/sh

# 
# Vivado(TM)
# runme.sh: a Vivado-generated Runs Script for UNIX
# Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
# 

if [ -z "$PATH" ]; then
  PATH=/home/arjun/tool/Vitis/2022.1/bin:/home/arjun/tool/Vivado/2022.1/ids_lite/ISE/bin/lin64:/home/arjun/tool/Vivado/2022.1/bin
else
  PATH=/home/arjun/tool/Vitis/2022.1/bin:/home/arjun/tool/Vivado/2022.1/ids_lite/ISE/bin/lin64:/home/arjun/tool/Vivado/2022.1/bin:$PATH
fi
export PATH

if [ -z "$LD_LIBRARY_PATH" ]; then
  LD_LIBRARY_PATH=
else
  LD_LIBRARY_PATH=:$LD_LIBRARY_PATH
fi
export LD_LIBRARY_PATH

HD_PWD='/home/arjun/Vivado_PROJECTS/ARM_XPM_03_sept_2025/AT426-BU-98000-r0p1-00rel0/hardware/m3_for_arty_a7/m3_for_arty_a7/m3_for_arty_a7.runs/synth_1'
cd "$HD_PWD"

HD_LOG=runme.log
/bin/touch $HD_LOG

ISEStep="./ISEWrap.sh"
EAStep()
{
     $ISEStep $HD_LOG "$@" >> $HD_LOG 2>&1
     if [ $? -ne 0 ]
     then
         exit
     fi
}

EAStep vivado -log m3_for_arty_a7_wrapper.vds -m64 -product Vivado -mode batch -messageDb vivado.pb -notrace -source m3_for_arty_a7_wrapper.tcl
