Yes, Vagrant uses VirtualBox (or another provider) to create a virtual machine. All the changes you make inside the VM, such as installing software or changing settings, are stored within the VM’s disk image, and they are persistent across reboots and shutdowns of the VM.

However, there are a couple of nuances to be aware of:
1. **Vagrant Destroy**: When you run `vagrant destroy`, it will delete the VM and all its contents. The script you have will destroy the existing VM before creating a new one, so running the script again will result in a fresh GitLab installation.
2. **Vagrant Provisioning**: The provisioning steps defined in the `Vagrantfile` (installing GitLab, etc.) are typically only run once when the VM is first created. If you run `vagrant up` on an existing VM, those steps won't be run again unless you explicitly run `vagrant provision`.

To ensure that your GitLab data and configurations are not lost, you may want to set up regular backups of the GitLab instance, or consider using volumes/mounts to store the GitLab data outside of the VM.

### Backing Up GitLab Data
GitLab has built-in backup and restore functionality. You can set up a cron job or another scheduled task inside the VM to run the GitLab backup command regularly. Here is an example command to create a backup of GitLab:

```sh
gitlab-rake gitlab:backup:create
```

This will create a backup archive file in the `./var/opt/gitlab/backups/` directory inside the VM by default.

### Restoring GitLab Data
If something goes wrong, you can restore GitLab from a backup file. First, copy the backup file to the `./var/opt/gitlab/backups/` directory inside the VM, then run the following command:

```sh
gitlab-ctl stop unicorn
gitlab-ctl stop sidekiq
gitlab-rake gitlab:backup:restore BACKUP=<backup-filename>
```

Replace `<backup-filename>` with the filename of the backup archive (without the path).

Please refer to the [official GitLab backup and restore documentation](https://docs.gitlab.com/ee/raketasks/backup_restore.html) for more details and options.