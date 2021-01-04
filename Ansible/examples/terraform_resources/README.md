# Provides support for deploying resources with Terraform and pulling resource information back into Ansible.

[Link for example is here](https://docs.ansible.com/ansible/latest/collections/community/general/terraform_module.html)  

### Requirements

*The below requirements are needed on the host that executes this module.*

- [ ] terraform

Notes:

- name: Basic deploy of a service
  community.general.terraform:
    project_path: '{{ project_dir }}'
    state: present

- name: Define the backend configuration at init
  community.general.terraform:
    project_path: 'project/'
    state: "{{ state }}"
    force_init: true
    backend_config:
      region: "eu-west-1"
      bucket: "some-bucket"
      key: "random.tfstate"

- name: Define the backend configuration with one or more files at init
  community.general.terraform:
    project_path: 'project/'
    state: "{{ state }}"
    force_init: true
    backend_config_files:
      - /path/to/backend_config_file_1
      - /path/to/backend_config_file_2
