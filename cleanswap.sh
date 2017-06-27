#!/bin/sh
swapoff -a
swapon -a
#Note that swapoff will fail if there is
#not enough physical memory available to swap everything back in
