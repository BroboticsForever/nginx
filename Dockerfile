#DOCKER VERSION 1.2.0
FROM phusion/baseimage:0.9.16
MAINTAINER Ian Tait <thetaiter@ku.edu>

#INITIAL SETUP
ENV HOME /root
RUN apt-get update

#INSTALL NGINX
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install nginx

#SETUP NGINX
COPY config/ /etc/nginx/conf.d/
RUN mkdir -p /etc/service/nginx
COPY scripts/startup.sh /etc/service/nginx/run

#CLEANUP
RUN apt-get -y clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

#EXPOSE PORTS
EXPOSE 80

#USE PHUSION INIT SYSTEM
CMD ["/sbin/my_init"]
