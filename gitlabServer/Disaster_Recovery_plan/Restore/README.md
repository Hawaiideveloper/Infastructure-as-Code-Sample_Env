You can create a backup and restore script, but please note that pushing backups to a public repository can expose sensitive data and is not recommended. You can make your repository private or use a cloud storage service with proper access controls instead.

Additionally, splitting the backup into small chunks and password protecting it adds complexity but does not secure the backup. It would be better to use an encryption tool to encrypt the backup file. You can use `gpg` for encrypting the backups.

### Restore Script
```bash
#!/bin/bash

set -e

# Configurations
REPO_DIR="/path/to/your/repo"
PASSPHRASE="YourPassPhrase"
BACKUP_DIR="/var/opt/gitlab/backups"
RESTORE_FILE="$BACKUP_DIR/restore_gitlab_backup.tar"

# Pull the latest backup chunks from the repository
cd $REPO_DIR
git pull origin main

# Concatenate and decrypt the backup file
cat backup_chunk_* > ${RESTORE_FILE}.gpg
gpg --batch --passphrase $PASSPHRASE -d ${RESTORE_FILE}.gpg > $RESTORE_FILE

# Restore GitLab from the backup file
gitlab-ctl stop unicorn
gitlab-ctl stop sidekiq
gitlab-rake gitlab:backup:restore BACKUP=$(basename $RESTORE_FILE .tar)
```

### Security Note
- Replace `YourPassPhrase` with a strong passphrase and keep it in a secure place.
- Don’t store the scripts with the passphrase in the public repository or any unsecured place.
- Consider using a private repository or secure cloud storage instead of a public repository for storing backups.
- Be aware of potential security risks and compliance requirements related to handling and storing sensitive data.