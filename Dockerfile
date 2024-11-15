FROM python:3.10

ARG salt_version

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y curl wget 
#RUN curl -sSk https://bootstrap.saltproject.io/ > /install_salt.sh && chmod +x /install_salt.sh
RUN curl -sSk https://github.com/saltstack/salt-bootstrap/releases/download/v2024.11.07/bootstrap-salt.sh > /install_salt.sh && chmod +x /install_salt.sh
RUN /install_salt.sh -X stable 
RUN mkdir -p /srv/salt /srv/pillar /etc/salt/
COPY minion.conf /etc/salt/minion


ENTRYPOINT [ "/usr/bin/salt-call" ]
CMD [ "test.ping" ]

