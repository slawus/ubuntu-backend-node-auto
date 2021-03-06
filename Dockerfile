FROM ubuntu:14.04

ENV HOME /root
ENV DEBIAN_FRONTEND noninteractive

#
# Install basic packages
#
RUN apt-get update
RUN apt-key update
RUN apt-get install -y software-properties-common build-essential curl wget

#
# Add repositories and update packages list
#
RUN curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -
RUN apt-add-repository ppa:ansible/ansible
RUN apt-get update

#
# Install Git
#
RUN apt-get install -y git

#
# Install node.js
#
RUN apt-get install -y nodejs
RUN ln -fs /usr/bin/nodejs /usr/bin/node

#
# Install global npm packages: gulp, bower
#
RUN npm install -g gulp bower

#
# Install SASS and Compass
#
RUN apt-get install -y ruby ruby-dev
RUN gem install sass compass

#
# Install Composer
#
RUN wget -O /bin/composer https://getcomposer.org/composer.phar && chmod a+x /bin/composer

#
# Install Ansible
#
RUN apt-get install -y ansible

#
# Clone CI tools
#
RUN git clone https://git.jazzy.pro/jazzy-ci-tools/ci-scripts.git /root/ci-scripts
RUN chmod a+x /root/ci-scripts/*
ENV PATH /root/ci-scripts:$PATH
