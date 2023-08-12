FROM postgres:15.4-alpine@sha256:8bc3c893342c766481df5fde58fab6f1a1115b94eb56778126163305243e9709

MAINTAINER Leonardo Gatica <lgatica@protonmail.com>

RUN apk add --no-cache pv py2-pip && pip install --no-cache-dir awscli && mkdir /backup

ENV AWS_DEFAULT_REGION=us-east-1

COPY restore.sh /restore.sh
COPY pguri.py /usr/local/bin/pguri

VOLUME /backup

CMD ["/restore.sh"]
