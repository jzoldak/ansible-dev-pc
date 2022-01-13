# Restic backups

# Create backups - use the alias
`cd $HOME; backup`

# Restore
`restic restore --verify --target $HOME latest`

# Back up other stuff, e.g. $HOME/repos
`printenv | grep RESTIC`
`export RESTIC_REPOSITORY=/media/jz/JHWZ-backup/repos`

## Backup
`restic init`
`restic --verbose backup $HOME/repos`

## Restore
`restic restore --verify --target $HOME latest`
