You can create a backup and restore script, but please note that pushing backups to a public repository can expose sensitive data and is not recommended. You can make your repository private or use a cloud storage service with proper access controls instead.

Additionally, splitting the backup into small chunks and password protecting it adds complexity but does not secure the backup. It would be better to use an encryption tool to encrypt the backup file. You can use `gpg` for encrypting the backups.

Here’s a script that backs up GitLab, encrypts and splits the backup, and pushes it to a repository:

### Backup Script
```bash
#!/bin/bash

set -e

# Configurations
BACKUP_DIR="/var/opt/gitlab/backups"
REPO_DIR="/path/to/your/repo"
CHUNK_SIZE=20M
PASSPHRASE="YourPassPhrase"

# Create GitLab backup
gitlab-rake gitlab:backup:create

# Find the latest backup file
LATEST_BACKUP=$(ls -1t $BACKUP_DIR/*_gitlab_backup.tar | head -1)

# Encrypt and split the backup file
cd $REPO_DIR
gpg --batch --passphrase $PASSPHRASE -c $LATEST_BACKUP
split -b $CHUNK_SIZE -d ${LATEST_BACKUP}.gpg backup_chunk_

# Add chunks to git and push
git add backup_chunk_*
git commit -m "Update GitLab backup"
git push origin main
```


### Security Note
- Replace `YourPassPhrase` with a strong passphrase and keep it in a secure place.
- Don’t store the scripts with the passphrase in the public repository or any unsecured place.
- Consider using a private repository or secure cloud storage instead of a public repository for storing backups.
- Be aware of potential security risks and compliance requirements related to handling and storing sensitive data.