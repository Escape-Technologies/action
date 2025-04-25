FROM alpine/curl:8.12.1

WORKDIR /app
COPY main.sh .
RUN chmod +x main.sh

ENTRYPOINT ["./main.sh"]
