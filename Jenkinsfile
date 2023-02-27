def val = ''
if (params.Datacenter == 'Ansible-Demo-DC-IND') {
val = 'Ansible-Demo-DC-IND-Agent'
} else if (params.Datacenter == 'Ansible-Demo-DC-US') {
val = 'Ansible-Demo-DC-US-Agent'
}

registryLogin = "index.docker.io/v1/"
repoURL = "uskar/alpinedevops:latest"

pipeline {
agent {
        label val
}
stages {
    stage('Set parameters') {
        steps {
            script {
                currentBuild.displayName = '#' + currentBuild.number +
                                            '-' + params.Datacenter
                properties([
                    parameters([
                        [
                            $class: 'ChoiceParameter',
                            choiceType: 'PT_SINGLE_SELECT',
                            description: '',
                            filterLength: 1,
                            filterable: false,
                            name: 'Environment',
                            randomName: 'choice-parameter-4317672109824',
                            script: [$class: 'GroovyScript',
                                fallbackScript: [
                                    classpath: [],
                                    sandbox: true,
                                    script: ''
                                ],
                                script: [
                                    classpath: [],
                                    sandbox: true,
                                    script: 'return [\'Select an Environment\',\'PROD\', \'DEV\']'
                                ]
                            ]
                        ],
                        [
                            $class: 'CascadeChoiceParameter',
                            choiceType: 'PT_SINGLE_SELECT',
                            description: '',
                            filterLength: 1,
                            filterable: false,
                            name: 'Datacenter',
                            randomName: 'choice-parameter-1434774074254',
                            referencedParameters: 'Environment',
                            script: [
                                $class: 'GroovyScript',
                                fallbackScript: [
                                    classpath: [],
                                    sandbox: true,
                                    script: ''
                                ], script: [
                                    classpath: [],
                                    sandbox: true,
                                    script: '''
                                        def choices
                                        switch(Environment){
                                            case \'PROD\':
                                                choices = [\'Select a Datacenter\', \'Ansible-Demo-DC-IND\', \'Ansible-Demo-DC-US\']
                                                break
                                            case \'DEV\':
                                                choices = [\'Select a Datacenter\', \'Ansible-Demo-Dev-DC-US\', \'Ansible-Demo-Dev-DC-US\']
                                                break
                                            default:
                                                choices = [\'N/A\']
                                                break
                                        }
                                        return choices'''
                                ]
                            ]
                        ],
                        [
                            $class: 'CascadeChoiceParameter',
                            choiceType: 'PT_SINGLE_SELECT',
                            description: '',
                            filterLength: 1,
                            filterable: false,
                            name: 'Provision_Server',
                            randomName: 'choice-parameter-143132192342342254',
                            referencedParameters: 'Datacenter',
                            script: [
                                $class: 'GroovyScript',
                                fallbackScript: [
                                    classpath: [],
                                    sandbox: true,
                                    script: ''
                                ], script: [
                                    classpath: [],
                                    sandbox: true,
                                    script: '''
                                        def choices
                                        if (Datacenter=='Ansible-Demo-DC-IND') {
                                                choices=['Ansible-Demo-DC-IND-Agent']
                                        } else if (Datacenter=='Ansible-Demo-DC-US') {
                                            choices=['Ansible-Demo-DC-US-Agent']
                                        } else {
                                            choices=['None']
                                        }
                                        return choices'''
                                ]
                            ]
                        ],
                        string(
                            defaultValue: '',
                            description: 'Enter your vCenter IP or FQDN',
                            name: 'vCenter_URL',
                            trim: true
                        ),
                        string(
                            defaultValue: '',
                            description: '',
                            name: 'vSphere_ResourcePool',
                            trim: true
                        ),
                        [
                            $class: 'CascadeChoiceParameter',
                            choiceType: 'PT_SINGLE_SELECT',
                            description: '',
                            filterLength: 1,
                            filterable: false,
                            name: 'vSphere_Datacenter',
                            randomName: 'choice-parameter-1434323202365329',
                            referencedParameters: 'Environment, Datacenter',
                            script: [
                                $class: 'GroovyScript',
                                fallbackScript: [
                                    classpath: [],
                                    sandbox: true,
                                    script: ''
                                ], script: [
                                    classpath: [],
                                    sandbox: true,
                                    script: '''
                                        def choices
                                        if (Environment=='PROD') {
                                            choices=['Ansible-Demo-DC-IND','Ansible-Demo-DC-US']
                                        } else if (Datacenter=='DEV') {
                                            choices=['Ansible-Demo-Dev-DC-IND','Ansible-Demo-Dev-DC-US']
                                        } else {
                                            choices=['None']
                                        }
                                        return choices'''
                                ]
                            ]
                        ],
                        string(
                            defaultValue: 'VM Network',
                            description: 'Enter the Network for WebServers deployment',
                            name: 'Network_Subnet',
                            trim: true
                        ),
                        string(
                            defaultValue: '255.255.255.0',
                            description: '',
                            name: 'Subnet_Netmask',
                            trim: true
                        ),
                        string(
                            defaultValue: '',
                            description: '',
                            name: 'Default_Gateway',
                            trim: true
                        ),
                        choice(
                            choices: [
                                'rhel7-server-x86_64-template'
                            ],
                            description: '',
                            name: 'Template'
                        ),
                        string(
                            defaultValue: '',
                            description: '',
                            name: 'DNS_Server1',
                            trim: true
                        ),
                        string(
                            defaultValue: '',
                            description: '',
                            name: 'DNS_Server2',
                            trim: true
                        ),
                        string(
                            defaultValue: '',
                            description: '',
                            name: 'DNS_Domain',
                            trim: true
                        ),
                        string(
                            defaultValue: '',
                            description: '',
                            name: 'worker01_ip',
                            trim: true
                        ),
                        string(
                            defaultValue: '',
                            description: '',
                            name: 'worker01_hostname',
                            trim: true
                        ),
                        string(
                            defaultValue: '',
                            description: '',
                            name: 'worker02_ip',
                            trim: true
                        ),
                        string(
                            defaultValue: '',
                            description: '',
                            name: 'worker02_hostname',
                            trim: true
                        ),
                        [
                            $class: 'CascadeChoiceParameter',
                            choiceType: 'PT_SINGLE_SELECT',
                            description: '',
                            filterLength: 1,
                            filterable: false,
                            name: 'Timezone',
                            randomName: 'choice-parameter-435671232309824',
                            referencedParameters: 'Datacenter',
                            script: [$class: 'GroovyScript',
                                fallbackScript: [
                                    classpath: [],
                                    sandbox: true,
                                    script: ''
                                ],
                                script: [
                                    classpath: [],
                                    sandbox: true,
                                    script:  '''
                                        def choices
                                        if (Datacenter=='Ansible-Demo-DC-IND') {
                                            choices=['Asia/Kolkata']
                                        } else if (Datacenter=='Ansible-Demo-DC-US') {
                                            choices=['america/denver']
                                        } else {
                                            choices=['None']
                                        }
                                        return choices'''
                                ]
                            ]
                        ]
                    ])
                ])
            }
        }
    }

    stage ('Replace values in inventory file') {
        steps {
                withCredentials([
                        [$class: 'UsernamePasswordMultiBinding', credentialsId: getCredentialsId(),
                usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD'],
                [$class: 'UsernamePasswordMultiBinding', credentialsId: 'rhel-login',
                usernameVariable: 'linuxos_username', passwordVariable: 'linuxos_userpassword']]) {
                sh '''
cp -rf CodePull/* .

cat >inventory/dynamic_inventory << EOL
[webserver]
${worker01_hostname}_webserver Mgmt_network_ipv4=${worker01_ip} vsphere_vm_hostname=${worker01_hostname}
${worker02_hostname}_webserver Mgmt_network_ipv4=${worker02_ip} vsphere_vm_hostname=${worker02_hostname}

[gowebserver]
${worker01_ip}
${worker02_ip}

[gowebserver:vars]
ansible_connection=ssh
ansible_user=$linuxos_username
ansible_python_interpreter=/usr/bin/python2.7
ansible_password=$linuxos_userpassword
ansible_ssh_common_args='-o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null'
EOL

cat >inventory/group_vars/all.yaml << EOL
# vCenter Login Information
vcenter_hostname: '$vCenter_URL'
vcenter_username: '$USERNAME'
vcenter_password: '$PASSWORD'

# Variable entries for Linux virtual machine
vsphere_datacenter: '$vSphere_Datacenter'
resource_pool: '$vSphere_ResourcePool'

# VM Network Components
Mgmt_network: '$Network_Subnet'
Mgmt_network_nmv4: '255.255.255.0'
Mgmt_network_gwv4: '$Default_Gateway'

# Tempalate of Red Hat Linux Server
lin_temp: '$Template'

# Timezone and NTP Server
# Use below command on a linux system to get timezone:
## timedatectl list-timezones
timezone: '$Timezone'
ntp_server:
  - '$DNS_Server1'
  - '$DNS_Server2'

# DNS server details
dns_server1: '$DNS_Server1'
dns_server2: '$DNS_Server2'
dns_domain: '$DNS_Domain'

'''
                }
        }
    }

    stage('WebServers Deployment') {
        steps {
            script {
                docker.withRegistry("https://${registryLogin}", "docker-registry-login01") {
                    docker.image("${repoURL}").pull()
                    docker.image("${repoURL}").inside() {
                        echo 'Starting the WevServers deployment....'
                        sh """
                        ansible-playbook -i inventory webserver.yaml --tags "deploy"
                        """
                    }
                }
            }            
        }
    }

    stage('Guest OS Customization') {
        steps {
            script {
                docker.withRegistry("https://${registryLogin}", "docker-registry-login01") {
                    docker.image("${repoURL}").pull()
                    docker.image("${repoURL}").inside() {
                        echo 'Starting the guest os customization'
                        sh """
                        ansible-playbook -i inventory webserver.yaml --tags "oscustom"
                        """
                    }
                }
            }
        }
    }


    stage('Snapshot Creation') {
        steps {
            script {
                docker.withRegistry("https://${registryLogin}", "docker-registry-login01") {
                    docker.image("${repoURL}").pull()
                    docker.image("${repoURL}").inside() {
                        echo 'Starting the snapshot creation process'
                        sh """
                        ansible-playbook -i inventory webserver.yaml --tags "vmsnapshot"
                        """
                    }
                }
            }
        }
    }

}
}

String getCredentialsId() {
if (params.Environment == "PROD") {
    "vCenter-Login"
} else if (params.Environment == "DEV") {
    "vCenter-Login"
} else {
        "N/A"
    }
}


String getGitUrl() {
    if (params.Environment == "PROD") {
    "https://github.com/Udayendu/ansibledemo.git"
} else if (params.Environment == "DEV") {
    "https://github.com/Udayendu/ansibledemo.git"
} else {
        "N/A"
    }
}
