#!/usr/bin/env bash
set -euo pipefail

echo "starting script"
sudo modprobe -r v4l2loopback
sudo modprobe v4l2loopback
echo "ending script"
