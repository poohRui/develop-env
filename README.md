# 日常开发环境配置

> 许多内容都是从 [wyg1997/DockerFiles](https://github.com/wyg1997/DockerFiles)，[wyg1997/Linux-configs](https://github.com/wyg1997/Linux-configs)处借鉴，非常感谢！

## 组件

- oh-my-zsh
  - bullet-train.zsh-theme
- pyenv
  - python 3.8.5
- tmux
- dev-pkg
	- cmake

## 基本使用手册
- 创建镜像
  ```shell
  ./build.sh
  ```
- 启动并运行容器
  ```shell
	# build container for cpu only
  docker run -d -it -P --name ${name} ${image-name}:${image-tag} /bin/zsh
	# build container support gpu
  docker run -d -it --shm-size=8G -P --runtime=nvidia ${image-name}:${image-tag} /bin/zsh
  docker exec -it ${name} /bin/zsh
  ```
## 其他说明
- 如果想使用vscode的remote-ssh连接容器进行开发
	- 在容器外生成密钥
  - 将公钥拷贝到容器内
  - 修改容器内sshd的配置并重启服务

