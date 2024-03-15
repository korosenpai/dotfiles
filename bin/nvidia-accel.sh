#!/bin/bash

[ -z "$1" ] && echo no command inputted && exit 1


export __NV_PRIME_RENDER_OFFLOAD=1
export __VK_LAYER_NV_optimus=NVIDIA_only
export __GLX_VENDOR_LIBRARY_NAME=nvidia
"$@" # execute command passed to it
