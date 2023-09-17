#!/bin/bash
git config --global user.name $GIT_USER_NAME && \
git config --global user.email $GIT_USER_EMAIL && \
ssh-keygen -q -N "" -f ~/.ssh/id_rsa && \
/usr/sbin/sshd -D -e -f /etc/ssh/sshd_config