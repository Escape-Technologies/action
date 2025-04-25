FROM alpine/curl:8.12.1

WORKDIR /app
COPY main.sh /app/main.sh
RUN chmod +x /app/main.sh

ENTRYPOINT ["/app/main.sh"]
