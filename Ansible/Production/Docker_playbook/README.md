


##### Run this command to install docker on the host(s) that are in the host file:
*and make sure your host file is inside of the same directory as the playbook.yml*

```
ansible-playbook -l Docker  -i host.ini -u ubuntu playbook.yml
```