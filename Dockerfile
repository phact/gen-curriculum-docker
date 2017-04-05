# Dockerfile for base collectd install

FROM ubuntu:16.04
MAINTAINER Sebastian Estevez estevezsebastian@gmail.com

# Install all apt-get utils and required repos
RUN apt-get update && \
    apt-get upgrade -y && \
    # Install add-apt-repository
    apt-get update && \
    # Install
    apt-get install -y \
    software-properties-common\
        # Install pip
        python-pip \
    python-setuptools \
    git \
    zip \
    jq \
    tree

# Make ssh dir
RUN mkdir /root/.ssh/

# Copy over private key, and set permissions
ADD ./id_rsa /root/.ssh/id_rsa

# Create known_hosts
RUN touch /root/.ssh/known_hosts
# Add github key
RUN ssh-keyscan github.org >> /root/.ssh/known_hosts
#RUN ssh-keygen -R github.org

#git stuff
RUN chmod 700 /root/.ssh/id_rsa
RUN echo "Host github.com\n\tStrictHostKeyChecking no\n" >> /root/.ssh/config
RUN git config --global url.ssh://git@github.com/.insteadOf https://github.com/

#clone curriculum 
RUN git clone git@github.com:phact/curriculum.git --branch course-generator
RUN cd /curriculum && git submodule update --init --recursive

# Install Java.
RUN \
  echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  add-apt-repository -y ppa:webupd8team/java && \
  apt-get update && \
  apt-get install -y oracle-java8-installer && \
  rm -rf /var/lib/apt/lists/* && \
  rm -rf /var/cache/oracle-jdk8-installer

# Define commonly used JAVA_HOME variable
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle
ENV PATH $JAVA_HOME/bin:$PATH

# Install Gradle
RUN wget https://services.gradle.org/distributions/gradle-2.0-bin.zip
RUN unzip gradle-2.0-bin.zip
RUN mv gradle-2.0 /opt/
RUN rm gradle-2.0-bin.zip
RUN export PATH=$PATH:/opt/gradle-2.0/bin/

EXPOSE 8000
EXPOSE 8080

RUN chmod +x curriculum/makeTreeJson.sh
CMD cd curriculum/courses/gencourse/ && ./gen-course-server.py
#CMD /bin/bash
