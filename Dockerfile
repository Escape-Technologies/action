FROM alpine/curl:8.12.1

WORKDIR /app
COPY main.sh /app/main.sh
RUN chmod +x /app/main.sh
RUN curl -sf https://raw.githubusercontent.com/Escape-Technologies/cli/refs/heads/main/scripts/install.sh | sh

ENTRYPOINT ["/app/main.sh"]
