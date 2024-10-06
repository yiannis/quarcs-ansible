#!/bin/bash

VM_ANSIBLE_ROOT=/code/ansible

source /root/.profile

cd $VM_ANSIBLE_ROOT
ansible-playbook playbooks/module_01_server.yaml -i inventory/localhost.yaml

exit $?
