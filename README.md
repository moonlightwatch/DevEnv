# DevEnv
用于VsCode远程连接的docker开发环境镜像

# 目的

简化开发环境配置过程，直接使用docker镜像。对下述步骤进行打包：

1. 操作系统选择
2. python基本环境
3. golang基本环境
4. git初始化配置
5. ssh服务初始化配置




# 用法

docker run -itd --name=mydev --restart=always -p 8022:22 -e GIT_USER_NAME=git -e GIT_USER_EMAIL=git@localhost -v ～/.ssh:/root/.ssh devenv
