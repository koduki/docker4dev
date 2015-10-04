FROM centos:centos7
MAINTAINER koduki

#
# set repositories
#
RUN yum update -y

#
# Install default packages
#
RUN yum install -y \
  sudo\
  passwd\
  syslog\
  wget\
  rsync\
  unzip\
  nkf\
  telnet\
  tar

#
# Install default packages
#
RUN yum install -y \
  openssh \
  git \
  ruby \
  ruby-dev

#
# Install clean up
#
RUN yum clean all

# Edit sudoers file
# To avoid error: sudo: sorry, you must have a tty to run sudo
RUN sed -i -e "s/Defaults    requiretty.*/ #Defaults    requiretty/g" /etc/sudoers

#
# operation user
#
RUN useradd docker
RUN passwd -f -u docker
RUN usermod -s /bin/zsh docker
RUN echo "docker    ALL=(ALL)       ALL" >> /etc/sudoers.d/docker

#
# App Dir
#
RUN echo 'export PATH=/usr/local/bin:$PATH' >> /root/.bashrc

#
# Install Heroku toolbox.
#
RUN wget -O- https://toolbelt.heroku.com/install.sh | sh;echo 'export PATH="/usr/local/heroku/bin:$PATH"' >> ~/.bashrc; source /root/.bashrc

#
# RUN
#
ENTRYPOINT ["/bin/bash", "-c"]
