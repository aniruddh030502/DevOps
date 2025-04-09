#!/bin/bash
# --- Variables ---
ANSIBLE_INVENTORY="/etc/ansible/hosts"
SSH_KEY="$HOME/.ssh/id_rsa"
USER_NAME="aniruddha" # Change to your actual SSH username for all worker nodes
NODES=("192.168.153.131" "192.168.153.133") # Add your worker node IPs here
# --- Function: Install Ansible ---
install_ansible() {
 echo "Installing Ansible..."
 if [ -f /etc/debian_version ]; then
 sudo apt update
 sudo apt install software-properties-common -y
 sudo add-apt-repository --yes --update ppa:ansible/ansible
 sudo apt install ansible -y
 elif [ -f /etc/redhat-release ]; then
 sudo yum install epel-release -y
 sudo yum install ansible -y
 else
 echo "Unsupported OS. Please use Ubuntu, Debian, CentOS or RHEL."
 exit 1
 fi
 ansible --version
}
# --- Function: Setup SSH Key ---
setup_ssh_key() {
 if [ ! -f "$SSH_KEY" ]; then
 echo "Generating SSH key..."
 ssh-keygen -t rsa -b 4096 -N "" -f "$SSH_KEY"
 else
 echo "SSH key already exists. Skipping generation."
 fi
}
# --- Function: Distribute SSH Key ---
distribute_ssh_key() {
 for ip in "${NODES[@]}"; do
 echo "Copying SSH key to $ip..."
 ssh-copy-id -o StrictHostKeyChecking=no ${USER_NAME}@$ip
 done
}
# --- Function: Configure Inventory ---
configure_inventory() {
 echo "Configuring Ansible inventory..."
 sudo bash -c "cat > $ANSIBLE_INVENTORY" <<EOF
[webservers]
192.168.158.128 ansible_user=$USER_NAME
192.168.158.131 ansible_user=$USER_NAME

[dbservers]
192.168.158.133 ansible_user=$USER_NAME
EOF
}
# --- Function: Test Connectivity ---
test_connectivity() {
 echo "Pinging all nodes using Ansible..."
 ansible all -m ping
}
# --- Execution Starts Here ---
install_ansible
setup_ssh_key
distribute_ssh_key
configure_inventory
test_connectivity
echo "✅ Ansible setup and node configuration completed successfully."