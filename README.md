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
  docker run -d -it --shm-size=8G -P --name ${name} --runtime=nvidia ${image-name}:${image-tag} /bin/zsh
  docker exec -it ${name} /bin/zsh
  ```
## 其他说明
### 使用vscode的remote-ssh

- 在容器外生成密钥
- 将公钥拷贝到容器内
- 修改容器内sshd的配置并重启服务

### YouCompleteMe配置个人项目

> 参考：
>
> * https://github.com/ycm-core/YouCompleteMe/issues/1981
> * https://github.com/ycm-core/YouCompleteMe#c-family-semantic-completion

1. 对cmake增加`-DCMAKE_EXPORT_COMPILE_COMMANDS=ON`标签
2. 将生成的`compile_command.json`拷贝或者软链接到个人项目的根目录
3. 将用户目录下的`.ycm_extra_conf.py`拷贝到项目的根目录并修改`compilation_database_folder`为项目的根路径。