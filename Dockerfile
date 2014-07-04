FROM ubuntu:14.04
MAINTAINER Daekwon Kim <propellerheaven@gmail.com>

# Update Base System
RUN apt-get update
RUN apt-get -y upgrade

# Set Environment Variables
ENV HOME /root

# Set Language Environment
RUN apt-get install -y language-pack-en
ENV LANGUAGE en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8
RUN locale-gen en_US.UTF-8
RUN dpkg-reconfigure locales

# Install Basic Packages
RUN apt-get install -y build-essential software-properties-common
RUN apt-get install -y wget curl git man unzip nano tmux
RUN apt-get install -y zsh
RUN git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
RUN cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
RUN chsh -s /bin/zsh

# Add configuration files
ADD ./config/.tmux.conf /root/.tmux.conf

WORKDIR /root
CMD ["zsh"]
