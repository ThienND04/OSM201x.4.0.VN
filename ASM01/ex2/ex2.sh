#!/bin/sh

echo "$(date)\n"

echo "Process: \n"
ps

echo "\nMemory usage:\n"
free -h

echo "\nCPU load: \n"
uptime

echo "\n\nKernel version is: \n"
uname -r
