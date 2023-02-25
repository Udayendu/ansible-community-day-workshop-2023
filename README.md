# Changelog

## [v1.0] - 24-02-2023 (dd-mm-yyyy)

### Added
  - Ansible Roles for:
    - VM Management:
      - vmdeploy
      - gocustom
      - vmdelete
    - VM Snapshot Management:
      - vmsnapshot
      - vmsnapshotrevert
      - vmsnapshotremove


### Jenkins file details
  - Jenkinsfile

### Software support
  - ansible: 7.1.0
  - ansible-core: 2.14.1
  - pyvmomi: 7.0.3
  - vSphere-Automation-SDK: 1.71.0

## Deployment Guide:

### VM Management
- To deploy the linux server, use the below command:

  > ansible-playbook -i inventory webserver.yaml --tags "deploy"

- To do the guest os customization, use the below command:

  > ansible-playbook -i inventory webserver.yaml --tags "oscustom"

- To delete the linux server use the below command:

  > ansible-playbook -i inventory webserver.yaml --tags "delete"

### VM Snapshot Management
- To take the vm snapshots, use the below command:

  > ansible-playbook -i inventory webserver.yaml --tags "vmsnapshot"

- To revert the vm snapshot, use the below command:

  > ansible-playbook -i inventory webserver.yaml --tags "vmsnapshotrevert"

- To remove the vm snapshot, use the below command:

  > ansible-playbook -i inventory webserver.yaml --tags "vmsnapshotremove"

