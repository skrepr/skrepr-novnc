FROM debian:buster-slim as novnc

WORKDIR /app
COPY . /app
COPY /vnc.html /app/index.html
RUN mv start-up /usr/local/bin/start-up && chmod +x /usr/local/bin/start-up

RUN apt-get update && apt-get install git python3 procps -y

ENTRYPOINT ["start-up"]

CMD ["bash", "-c", "/app/utils/novnc_proxy --ssl-only --key /etc/ssl/key.pem --cert /etc/ssl/domain.pem --listen localhost:${LISTEN_PORT} --vnc ${VNC_HOST}:${VNC_PORT}"]