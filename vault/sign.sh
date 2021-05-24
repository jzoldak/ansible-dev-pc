#!/usr/bin/env bash
# If this isn't working, you probably need to vault login
vault-ssh-sign() {
    set -x;
    local ca='dso';
    local users='jz,ubuntu,root,algo';
    local ssh_key;
    [[ -n "${1}" ]] && ssh_key="${HOME}/.ssh/$(basename "${1}")";
    ssh_key="${ssh_key:-"${HOME}/.ssh/id_ed25519.pub"}";
    vault write -field=signed_key "ssh-client-signer/sign/${ca}" public_key=@"${ssh_key%%.pub}.pub" valid_principals="${users}" > "${ssh_key%%.pub}-cert.pub";
    ssh-add -d ${ssh_key}
    ssh-add ${ssh_key%%.pub}
    set +x
}
echo "starting script"
vault-ssh-sign
echo "ending script"
