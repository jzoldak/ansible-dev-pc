#!/usr/bin/env bash
set -euo pipefail

# Do this once as setup
# mkdir -p /home/jz/repos/devops
# cd /home/jz/repos/devops
# git clone git@gitlab.clearballot.com:devops/pki-client.git
# cd /home/jz/repos/devops/pki-client
# python3 -m venv venv
# pip install hvac passlib pyopenssl

/home/jz/bin/sign.sh
cd /home/jz/repos/devops/pki-client
source venv/bin/activate
./generate_certs.py -l --nss-import --ca "cbg-employee-mtls-root-blue"
deactivate
echo "Signed cert will expire in 1 hour."
