ARG IMAGE=ubuntu:18.04

FROM $IMAGE
MAINTAINER poohRui 
LABEL Discription="Develop environment" version="1.0"

# Args defined at build-time
ARG USERNAME=visitor
ARG USER_UID=1000
ARG USER_GID=$USER_UID

# Basic configurations for specific system including neovim and nodejs
COPY scripts/basic_config.sh /tmp
COPY ubuntu/sources.list /tmp
RUN ./tmp/basic_config.sh $USERNAME $USER_UID $USER_GID

RUN git clone --depth=1 https://gitee.com/romkatv/powerlevel10k.git /tmp/powerlevel10k
COPY tmux/.tmux.conf /tmp 
COPY tmux/.tmux.conf.local /tmp 
COPY zsh/.zshrc /tmp
COPY oh-my-zsh/oh-my-zsh_install.sh /tmp
COPY oh-my-zsh/oh-my-zsh_plugins_install.sh /tmp
COPY pip/pip.conf /tmp
COPY pyenv/pyenv_install.sh /tmp

USER $USERNAME
WORKDIR /home/$USERNAME

RUN sudo chown -R $USERNAME:$USERNAME /tmp

# Install oh-my-zsh
RUN sudo usermod -s /bin/zsh $USERNAME 
RUN /tmp/oh-my-zsh_install.sh && /tmp/oh-my-zsh_plugins_install.sh

RUN mkdir -p ~/.config && git clone https://github.com/tmux-plugins/tmux-resurrect ~/.config/tmux-resurrect \
  && cp /tmp/.tmux.conf ~/ && cp /tmp/.tmux.conf.local ~/ && cp /tmp/.zshrc ~/ && mkdir ~/.config/pip && cp /tmp/pip.conf ~/.config/pip \
  && cp -r /tmp/powerlevel10k ~/.oh-my-zsh/themes

# Install pyenv and python 3.8.5
RUN /tmp/pyenv_install.sh && echo "\nexport PATH=\"\$HOME/.pyenv/bin:\$PATH\"\neval \"\$(pyenv init -)\"\neval \"\$(pyenv virtualenv-init -)\"" >> ~/.zshrc \
  && v=3.8.5;wget http://npm.taobao.org/mirrors/python/$v/Python-$v.tar.xz -P ~/.pyenv/cache/ \
  && CONFIGURE_OPTS=--enable-shared ~/.pyenv/bin/pyenv install $v && ~/.pyenv/bin/pyenv global $v


# Remove all tmp files
RUN rm -rf /tmp/*

EXPOSE 22 8886 8887 8888


