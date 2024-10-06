#!/bin/bash

# Script to install everything on the current host
# To be run as the root user

# First, set up Ansible
bash ansible-bootstrap.sh

# Then install all the QUARCS modules
bash module_01_server__build.sh
