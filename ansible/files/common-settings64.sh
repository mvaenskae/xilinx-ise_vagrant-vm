 
# Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.

if [ -n "$LD_ASSUME_KERNEL" ]; then
   echo "The LD_ASSUME_KERNEL environment variable is set. Xilinx software will not work correctly and may crash if this variable is set. Please unset the variable before running any Xilinx software."
else
   XIL_SCRIPT_LOC="$1"
   if [ -n "$PATH" ]; then
      PATH=${XIL_SCRIPT_LOC}/bin/lin64:${PATH};export PATH;
    else
      PATH=${XIL_SCRIPT_LOC}/bin/lin64;export PATH;
   fi

   if [ -n "$LD_LIBRARY_PATH" ]; then
      LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:${XIL_SCRIPT_LOC}/lib/lin64;export LD_LIBRARY_PATH;
    else
      LD_LIBRARY_PATH=${XIL_SCRIPT_LOC}/lib/lin64;export LD_LIBRARY_PATH;
   fi

   unset XIL_SCRIPT_LOC
fi
