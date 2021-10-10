FROM {{images}}
MAINTAINER poohRui 
LABEL Discription="Develop environment" version="1.0"

ARG USERNAME={{username}}
ARG USER_UID={{user_uid}}
ARG USER_GID={{user_gid}}
ARG DEBIAN_FRONTEND=noninteractive

COPY bash/*.sh /tmp
COPY configs/* /tmp
RUN ./tmp/create_user.sh $USERNAME $USER_UID $USER_GID {{linux_type}}
RUN ./tmp/install_cmake.sh {{cmake_version}} {{linux_type}}
RUN ./tmp/install_python.sh {{python_version}} {{linux_type}}
RUN ./tmp/install_gcc.sh {{gcc_version}} {{linux_type}}
RUN ./tmp/install_necessary_packages.sh {{linux_type}}

RUN git clone --depth=1 https://gitee.com/romkatv/powerlevel10k.git /tmp/powerlevel10k

USER $USERNAME
WORKDIR /home/$USERNAME
RUN sudo chown -R $USERNAME:$USERNAME /tmp

# Install oh-my-zsh
RUN sudo usermod -s /bin/zsh $USERNAME 
RUN /tmp/oh-my-zsh_install.sh && /tmp/oh-my-zsh_plugins_install.sh

RUN mkdir -p ~/.config \
  && cp /tmp/.tmux.conf ~/ && cp /tmp/.tmux.conf.local ~/ && cp /tmp/.zshrc ~/ && mkdir ~/.config/pip && cp /tmp/pip.conf ~/.config/pip \
  && cp -r /tmp/powerlevel10k ~/.oh-my-zsh/themes && cp /tmp/.vimrc ~/

RUN ./tmp/install_vim_plugins.sh
RUN rm -rf /tmp/*

EXPOSE 22 8886 8887 8888
# Seem unnecessary since enter the container using `exec`
ENTRYPOINT [ "/bin/zsh" ]
CMD ["-l"]

