echo '##################'
echo '# Set up Ansible #'
echo '##################'
export DEBIAN_FRONTEND=noninteractive

apt update
apt upgrade
apt install --yes python3 python3-pip pipx git

pipx install 'ansible-core>=2.17,<2.18'
pipx ensurepath
source /root/.profile

ansible-galaxy collection install ansible.posix
