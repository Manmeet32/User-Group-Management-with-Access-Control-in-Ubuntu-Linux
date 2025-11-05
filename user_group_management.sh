#!/bin/bash
# -----------------------------------------------
# Project: User & Group Management with Access Control
# OS: Ubuntu Linux
# Author: Abhi
# -----------------------------------------------

echo "===== User & Group Management with Access Control ====="

# Step 1: Create new users
echo "Creating new users..."
sudo useradd -m -s /bin/bash alice
sudo useradd -m -s /bin/bash bob
sudo useradd -m -s /bin/bash charlie
echo "Users alice, bob, and charlie created successfully."

# Step 2: Set passwords for users
echo "Setting passwords..."
echo "alice:12345" | sudo chpasswd
echo "bob:12345" | sudo chpasswd
echo "charlie:12345" | sudo chpasswd
echo "Passwords set successfully."

# Step 3: Create groups
echo "Creating groups..."
sudo groupadd developers
sudo groupadd testers
echo "Groups developers and testers created successfully."

# Step 4: Add users to groups
echo "Adding users to groups..."
sudo usermod -aG developers alice
sudo usermod -aG testers bob
sudo usermod -aG developers,charlie
echo "Users added to respective groups successfully."

# Step 5: Create a shared project directory
echo "Creating shared directory..."
sudo mkdir /project
sudo chown alice:developers /project
sudo chmod 770 /project
echo "Shared directory '/project' created with restricted access."

# Step 6: Apply Access Control Lists (ACL)
echo "Applying Access Control Lists (ACL)..."
sudo setfacl -m u:bob:rwx /project
sudo setfacl -m u:charlie:rx /project
echo "ACL permissions applied successfully."

# Step 7: Verify user details and access permissions
echo "Verifying user group memberships..."
id alice
id bob
id charlie

echo "Verifying ACL details..."
getfacl /project

# Step 8: Display ownership and permissions
echo "Checking ownership and permissions..."
ls -ld /project

echo "===== Setup Completed Successfully ====="
