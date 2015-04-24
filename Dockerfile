# Pull base image
FROM resin/rpi-raspbian:wheezy
MAINTAINER Vincent RABAH <vincent.rabah@gmail.com>

# Install Java.
RUN  \
  echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee /etc/apt/sources.list.d/webupd8team-java.list && \
  echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee -a /etc/apt/sources.list.d/webupd8team-java.list && \
  apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886 && \
  echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections && \
  apt-get update && \
  apt-get install -y oracle-java8-installer \
  --no-install-recommends && \ 
#  apt-get remove -y oracle-java8-installer && \
  apt-get clean -y && \
  apt-get autoclean -y && \
  apt-get autoremove -y && \
#  rm -rf /var/lib/apt/lists/* && \
  rm -rf /var/cache/oracle-jdk8-installer && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* 

# Define working directory.
WORKDIR /data

# Define commonly used JAVA_HOME variable
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle

# Define default command.
CMD ["bash"]
