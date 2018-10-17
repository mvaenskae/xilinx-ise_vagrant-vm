# Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.

if [ -n "$LD_ASSUME_KERNEL" ]; then
   echo "The LD_ASSUME_KERNEL environment variable is set. Xilinx software will not work correctly and may crash if this variable is set. Please unset the variable before running any Xilinx software."
else
   XIL_SCRIPT_LOC="$1"
   XILINX_EDK=${XIL_SCRIPT_LOC};export XILINX_EDK;
   if [ -n "$LD_LIBRARY_PATH" ]; then
      LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:${XILINX_EDK}/lib/lin64;export LD_LIBRARY_PATH;
    else
      LD_LIBRARY_PATH=${XILINX_EDK}/lib/lin64;export LD_LIBRARY_PATH;
   fi

   if [ -n "$PATH" ]; then
      PATH=${XILINX_EDK}/bin/lin64:${XIL_SCRIPT_LOC}/gnu/microblaze/lin/bin:${XIL_SCRIPT_LOC}/gnu/powerpc-eabi/lin/bin:${XIL_SCRIPT_LOC}/gnu/arm/lin/bin:${XIL_SCRIPT_LOC}/gnu/microblaze/linux_toolchain/lin64_be/bin:${XIL_SCRIPT_LOC}/gnu/microblaze/linux_toolchain/lin64_le/bin:${PATH};export PATH;
    else
      PATH=${XILINX_EDK}/bin/lin64:${XIL_SCRIPT_LOC}/gnu/microblaze/lin/bin:${XIL_SCRIPT_LOC}/gnu/powerpc-eabi/lin/bin:${XIL_SCRIPT_LOC}/gnu/arm/lin/bin:${XIL_SCRIPT_LOC}/gnu/microblaze/linux_toolchain/lin64_be/bin:${XIL_SCRIPT_LOC}/gnu/microblaze/linux_toolchain/lin64_le/bin;export PATH;
   fi

   unset XIL_SCRIPT_LOC
fi 
