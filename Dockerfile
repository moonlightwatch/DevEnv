FROM ubuntu:22.04
COPY run.sh /run.sh
RUN apt update \
    && apt upgrade -y \
    && apt install -y vim git openssh-server python3 python3-pip wget curl \
    && echo "PermitRootLogin yes" >> /etc/ssh/sshd_config \
    && echo "PasswordAuthentication no" >> /etc/ssh/sshd_config \
    && echo "PermitEmptyPasswords no" >> /etc/ssh/sshd_config \
    && echo "PubkeyAuthentication yes" >> /etc/ssh/sshd_config \
    && mkdir /run/sshd \
    && mkdir /root/.ssh \
    && wget https://go.dev/dl/go1.21.4.linux-amd64.tar.gz \
    && rm -rf /usr/local/go && tar -C /usr/local -xzf go1.21.1.linux-amd64.tar.gz \
    && echo "PATH=$PATH:/usr/local/go/bin" >> /etc/profile \
    && chmod u+x /run.sh \
    && /usr/local/go/bin/go env -w GO111MODULE=on \
    && /usr/local/go/bin/go env -w GOPROXY=https://goproxy.cn,direct
    
ENV TZ=Asia/Shanghai
ENV GIT_USER_NAME=git
ENV GIT_USER_EMAIL=git@localhost


# 暴露22端口
EXPOSE 22
# 生成密钥并启动 sshd 服务
CMD /run.sh