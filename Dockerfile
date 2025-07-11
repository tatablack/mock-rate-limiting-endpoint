FROM python:3.9.19-bullseye

# install the result handler and reactor module /usr/local/bin

RUN apk update ; \
    apk upgrade ; \
    apk add build-base; \
    echo $PATH ; \
    pip install --upgrade pip twisted ratelimit ; \
    easy_install --upgrade pytz ; \
    cd /tmp ; \
    apk del git build-base ; \
    rm -rf /var/cache/apk/* ;

COPY ./endpoint.py /usr/local/bin/endpoint.py

RUN chmod +x /usr/local/bin/*.py
