#!/bin/bash

# Settings
echo "Do you want to automatically reboot after an auto-upgrade? [true/false]"
read AUTO_REBOOT_AT_UPGRADE

echo "What SSH port do you want to configure?"
read SSH_PORT

echo "What username should the non root sudo user have?"
read NONROOT_USERNAME

echo "What password should this user have?"
read -s NONROOT_PASSWORD


# Exit if error
set -e

## SSH key
source ./00-ssh.sh

## Upgrade full system
source ./01-upgrade.sh

## Enable autoupdates with purging
source ./02-autoupdate.sh

## Install and configure ZSH
source ./03-zsh.sh

## Add swap space (1 + size of ram)
source ./04-swap.sh

## Add a nonroot user
source ./05-nonroot-user.sh

## Add basic security measures
source ./06-security.sh
