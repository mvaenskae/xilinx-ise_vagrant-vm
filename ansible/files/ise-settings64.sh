# Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.

if [ -n "$LD_ASSUME_KERNEL" ]; then
   echo "The LD_ASSUME_KERNEL environment variable is set. Xilinx software will not work correctly and may crash if this variable is set. Please unset the variable before running any Xilinx software."
else
   XIL_SCRIPT_LOC="$1"
   XILINX=${XIL_SCRIPT_LOC};export XILINX;
   XILINX_DSP=$XILINX;export XILINX_DSP;
   if [ -n "$PATH" ]; then
      PATH=${XILINX}/bin/lin64:${XILINX}/sysgen/util:${XILINX}/sysgen/bin:${XILINX}/../../../DocNav:${PATH};export PATH;
    else
      PATH=${XILINX}/bin/lin64:${XILINX}/sysgen/util:${XILINX}/sysgen/bin:${XILINX}/../../../DocNav;export PATH;
   fi

   LMC_HOME=${XILINX}/smartmodel/lin64/installed_lin64;export LMC_HOME;
   if [ -n "$LD_LIBRARY_PATH" ]; then
      LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:${XILINX}/lib/lin64:${LMC_HOME}/lib:${XILINX}/sysgen/lib;export LD_LIBRARY_PATH;
    else
      LD_LIBRARY_PATH=${XILINX}/lib/lin64:${LMC_HOME}/lib:${XILINX}/sysgen/lib;export LD_LIBRARY_PATH;
   fi

   unset XIL_SCRIPT_LOC
fi

