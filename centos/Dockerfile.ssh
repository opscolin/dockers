## build my own basic image 
FROM centos
MAINTAINER Colin 
ENV REFRESHED_AT 2015-04-08
## install ssh service and basic tool
RUN yum install -y openssh-server
RUN yum install -y net-tools hostname tar wget 
RUN echo "root:root" | chpasswd
EXPOSE 22
## set ssh login 
RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key
RUN ssh-keygen -t dsa -f /etc/ssh/ssh_host_dsa_key
RUN ssh-keygen -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key
RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config
## RUN sed -ri 's/#UsePAM no/UsePAM no/g' /etc/ssh/sshd_config
RUN sed -ri 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g'  /etc/pam.d/sshd
## develop environment
# CMD ["/usr/sbin/sshd", "-D"]
## Live environment
# -D parameter makes sshd run at front
ENTRYPOINT ["/usr/sbin/sshd","-D"]
