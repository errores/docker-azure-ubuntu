#
# Dockerfile for Ubuntu
#
FROM ubuntu:16.04
MAINTAINER Claudio

# ====================
# Download and Install SSH
# ====================

RUN	set -ex \
	&& apt-get update \
	&& apt-get install -y --no-install-recommends openssh-server \
	&& echo "root:Docker!" | chpasswd 



COPY sshd_config /etc/ssh/

COPY entrypoint.sh /usr/local/bin/

RUN chmod u+x /usr/local/bin/entrypoint.sh

EXPOSE 2222 80

ENTRYPOINT ["entrypoint.sh"]
