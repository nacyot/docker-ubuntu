FROM ubuntu:14.04
MAINTAINER Daekwon Kim <propellerheaven@gmail.com>

# Set Environment Variables & Language Environment
ENV HOME /root
ENV LC_ALL en_US.UTF-8

# Update Base System
RUN apt-get update && apt-get -y upgrade \ 
      && apt-get install -y language-pack-en \
      && locale-gen en_US.UTF-8 \
      && dpkg-reconfigure locales

# Install Basic Packages
RUN apt-get install -y build-essential software-properties-common wget curl git man unzip nano tmux colord zsh emacs

# Install Zsh
RUN git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh \
      && cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc \
      && chsh -s /bin/zsh

# Install peco & put peco script
RUN cd /opt \
      && wget https://github.com/peco/peco/releases/download/v0.1.12/peco_linux_amd64.tar.gz \
      && tar xvf peco_linux_amd64.tar.gz \
      && ln -s /opt/peco_linux_amd64/peco /usr/local/bin \
      && mkdir -p ~/.zsh \
      && git clone https://gist.github.com/2c9151f2274ccad8bffc.git ~/.zsh/ \
      && echo "source ~/.zsh/peco-select-history.zsh" >> ~/.zshrc

# Install jq
RUN cd /opt \ 
      && mkdir jq \
      && wget -O ./jq/jq http://stedolan.github.io/jq/download/linux64/jq \
      && chmod +x ./jq/jq \
      && ln -s /opt/jq/jq /usr/local/bin

# Add configuration files
ADD ./config/.tmux.conf /root/.tmux.conf

WORKDIR /root
CMD ["zsh"]
