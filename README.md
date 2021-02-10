# Docker日常开发环境配置

## 组件

- oh-my-zsh
  - bullet-train.zsh-theme
- pyenv
  - python 3.8.5
- tmux

## 使用手册
- 创建Docker
  ```shell
  ./build.sh
  ```
- 启动并运行
  ```shell
  docker run -d -it -P --name ${name} ${image-name}:${image-tag} /bin/zsh
  docker exec -it ${name} /bin/zsh
  ```
