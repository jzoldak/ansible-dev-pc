# README

## Troubleshooting
When running `ansible-playbook` commands, if you get a message that says: 
`ERROR: Ansible requires the locale encoding to be UTF-8; Detected None.`

Do this:
`export LC_ALL="en_US.UTF-8"`
