#!/bin/bash

VM_ANSIBLE_ROOT=/root/ansible
VM_ANSIBLE_INVENTORY=inventory.yaml
VM_ANSIBLE_INVENTORY_PATH=$VM_ANSIBLE_ROOT/$VM_ANSIBLE_INVENTORY

echo '##################'
echo '# Set up Ansible #'
echo '##################'
export DEBIAN_FRONTEND=noninteractive

apt update
apt upgrade
apt install --yes python3 python3-pip pipx git

pipx install ansible-core
pipx ensurepath
source /root/.profile

mkdir $VM_ANSIBLE_ROOT
cat > $VM_ANSIBLE_INVENTORY_PATH <<EOF
ungrouped:
  hosts:
    localhost:
      ansible_connection: local
      ansible_user: root
EOF

ansible-galaxy collection install ansible.posix

echo '############################'
echo '# Execute Ansible playbook #'
echo '############################'
cd $VM_ANSIBLE_ROOT
ansible-playbook /code/ansible/server.yaml -i $VM_ANSIBLE_INVENTORY

exit 0
