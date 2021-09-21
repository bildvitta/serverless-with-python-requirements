FROM python:3.8-alpine
ENV PYTHONUNBUFFERED 1

RUN apk update && apk add --no-cache make gcc musl-dev libffi-dev openssl-dev python3-dev bash nodejs npm

COPY ./src/entrypoint.sh /usr/local/bin/entrypoint
RUN chmod +x /usr/local/bin/entrypoint

ENTRYPOINT ["entrypoint"]
