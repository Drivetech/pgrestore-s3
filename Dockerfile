FROM postgres:10.23-alpine@sha256:63cfb6eac6b362c7c994f22c3804c61b31898cf0cb52f8e7e86bd99a244f4366

MAINTAINER Leonardo Gatica <lgatica@protonmail.com>

RUN apk add --no-cache pv py2-pip && pip install --no-cache-dir awscli && mkdir /backup

ENV AWS_DEFAULT_REGION=us-east-1

COPY restore.sh /restore.sh
COPY pguri.py /usr/local/bin/pguri

VOLUME /backup

CMD ["/restore.sh"]
