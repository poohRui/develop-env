# 日常开发环境配置

> 许多内容都是从 [wyg1997/DockerFiles](https://github.com/wyg1997/DockerFiles)，[wyg1997/Linux-configs](https://github.com/wyg1997/Linux-configs)处借鉴，非常感谢！

## 基本组成

- [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh)
  - [Powerlevel10k](https://github.com/romkatv/powerlevel10k)
- [pyenv](https://github.com/pyenv/pyenv)
  - python 3.8.5
- tmux
- dev-pkg
  - cmake

## 开发环境搭建
- 创建镜像
  ```shell
  ./build.sh
  ```
- 启动并运行容器
  ```shell
  # 启动一个纯CPU的开发环境
  ./start_cpu_only_container ${container-name} ${image-name} ${image-tag}
  
  # 启动一个GPU的开发环境
  ./start_gpu_only_container ${container-name} ${image-name} ${image-tag}
  
  # 进入开发环境
  ./coding ${container-name}
  ```
* 停止并删除容器

  ```shell
  ./destroy ${container-name}
  ```

## 功能支持

### zsh

- `oh-my-zsh`采用`powerlevel10k`，在第一次进入容器时，会自动触发样式的配置，具体参考[这里](https://github.com/romkatv/powerlevel10k#configuration-wizard)。
- 支持在命令行窗口使用`vim`的操作手法，`powerlevel10k`的`prompt_char`特性使得可以明显区分出当前在什么模式下，具体参考[这里](https://github.com/romkatv/powerlevel10k#batteries-included)。
- 已添加[git插件](https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/git/git.plugin.zsh)，支持git相关操作的快捷方式。
- 已添加[z插件](https://github.com/rupa/z)，可以快速跳转到之前跳转过的路径。
- 已添加[zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)，用于高亮命令。
- 已添加[zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)，用于建议补全，并绑定快捷键：
  - `ctrl + j`：采纳并执行建议补全
  - `ctrl + f`：采纳建议补全
- 可以使用`ex`命令解压缩任意格式的压缩包。
- 可以使用`upload`命令上传临时文件和其他人分享。

### tmux

- 待填坑

## 其他说明

### 使用vscode的remote-ssh

- 在容器外生成密钥
- 将公钥拷贝到容器内
- 修改容器内sshd的配置并重启服务

