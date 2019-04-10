FROM debian:9.8
MAINTAINER Jonas Philipp Lüke "jpluke@ull.edu.es"

ENV VERSION 2019.1

#ENV DEBIAN_FRONTEND noninteractive
#ENV DEBCONF_NONINTERACTIVE_SEEN true

RUN apt-get -y update
RUN apt-get -y install sudo

# Set the locale


#RUN dpkg-reconfigure locales

ADD basic-setup.sh /src/misc/basic-setup.sh
ADD ovs-setup.sh /src/misc/ovs-setup.sh
ADD ryu-setup.sh /src/misc/ryu-setup.sh
ADD mininet-setup.sh /src/misc/mininet-setup.sh
RUN bash /src/misc/basic-setup.sh
RUN bash /src/misc/ovs-setup.sh
RUN bash /src/misc/ryu-setup.sh
RUN bash /src/misc/mininet-setup.sh



ADD startup.sh /src/misc/startup.sh
RUN apt-get install -y locales locales-all
ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8


RUN chmod a+x /src/misc/startup.sh
ENTRYPOINT cd /src/misc ; ./startup.sh
