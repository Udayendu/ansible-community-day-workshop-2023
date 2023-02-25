# Changelog

## [v1.0] - 25-02-2023 (dd-mm-yyyy)

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

### Docker file details
  - alpinedevops.dockerfile

### Software support
  - alpine: 3.17
  - ansible: 7.1.0
  - ansible-core: 2.14.1
  - pyvmomi: 7.0.3
  - vSphere-Automation-SDK: 1.71.0

## Docker image build process
- To build the docker image, use the below command:
  
  > $ docker build --no-cache=true -f <file_name>.dockerfile -t <docker_registry>/alpinedevops:latest

- To push the docker image, use the below command:

  > $ docker login
  > $ docker push <docker_registry>/alpinedevops:latest


## Deployment Guide:

### VM Management
- To deploy the linux server, use the below command:

  > $ ansible-playbook -i inventory webserver.yaml --tags "deploy"

- To do the guest os customization, use the below command:

  > $ ansible-playbook -i inventory webserver.yaml --tags "oscustom"

- To delete the linux server use the below command:

  > $ ansible-playbook -i inventory webserver.yaml --tags "delete"

### VM Snapshot Management
- To take the vm snapshots, use the below command:

  > $ ansible-playbook -i inventory webserver.yaml --tags "vmsnapshot"

- To revert the vm snapshot, use the below command:

  > $ ansible-playbook -i inventory webserver.yaml --tags "vmsnapshotrevert"

- To remove the vm snapshot, use the below command:

  > $ ansible-playbook -i inventory webserver.yaml --tags "vmsnapshotremove"


### Design Diagram

  ![doagram](https://user-images.githubusercontent.com/1809177/221341460-b444c21c-8898-4270-b1b0-9c81289b4400.png)
       
