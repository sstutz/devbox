#!/usr/bin/env bash

if [[ ! -f /ansibe-updated ]]; then
    apt-add-repository ppa:ansible/ansible
    apt-get update
    apt-get install ansible
fi
