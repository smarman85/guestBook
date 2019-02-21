FROM smarman/alp_py37

ADD app /srv/
ADD requirements.txt uwsgi.ini /srv/

WORKDIR /srv

RUN apk add --no-cache --virtual \
    .build-deps \
    gcc \
    python3-dev \
    build-base \
    linux-headers && \
    python3.7 -m venv /srv/venv && source /srv/venv/bin/activate && \
    pip install -r /srv/requirements.txt && \
    apk del .build-deps

CMD ["/srv/venv/bin/uwsgi", "--ini", "/srv/uwsgi.ini"]
