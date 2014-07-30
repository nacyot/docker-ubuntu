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
RUN apt-get install -y wget curl git man unzip nano tmux emacs
RUN apt-get install -y zsh
RUN git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
RUN cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
RUN chsh -s /bin/zsh

# Install peco
WORKDIR /opt
RUN wget https://github.com/peco/peco/releases/download/v0.1.12/peco_linux_amd64.tar.gz
RUN tar xvf peco_linux_amd64.tar.gz
RUN ln -s /opt/peco_linux_amd64/peco /usr/local/bin

# Put peco script
RUN mkdir -p ~/.zsh
RUN git clone https://gist.github.com/2c9151f2274ccad8bffc.git ~/.zsh/
RUN echo "source ~/.zsh/peco-select-history.zsh" >> ~/.zshrc

# Install jq
RUN mkdir jq
RUN wget -O ./jq/jq http://stedolan.github.io/jq/download/linux64/jq
RUN chmod +x ./jq/jq
RUN ln -s /opt/jq/jq /usr/local/bin

# Add configuration files
ADD ./config/.tmux.conf /root/.tmux.conf

WORKDIR /root
CMD ["zsh"]
