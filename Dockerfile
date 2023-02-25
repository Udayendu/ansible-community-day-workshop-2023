# alpine based devops image
FROM alpine:latest
RUN apk -U upgrade
RUN apk --no-cache add ca-certificates \
    && rm -rf /var/cache/apk/*
RUN ln -s /usr/bin/python3 /usr/bin/python
RUN apk --no-cache add py3-pip openssh sshpass curl git expect wget openjdk17-jre elinks tree bash openssl
RUN pip3 install --trusted-host=pypi.python.org --trusted-host pypi.org --trusted-host files.pythonhosted.org --default-timeout=100 \
    ansible pyvmomi requests requests_toolbelt scp paramiko passlib netaddr jmespath requests_ntlm jq \
    pywinrm pywinrm[credssp] pypsrp pypsrp[credssp]
RUN pip3 install --trusted-host=pypi.python.org --trusted-host pypi.org --trusted-host files.pythonhosted.org --default-timeout=100 \
    --upgrade git+https://github.com/vmware/vsphere-automation-sdk-python.git
RUN echo " " >> /root/.bashrc
RUN echo "export ANSIBLE_CALLBACKS_ENABLED=profile_tasks" >> /root/.bashrc

