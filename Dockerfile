FROM alpine:latest

WORKDIR /app
COPY main.sh /app/main.sh
RUN <<EOF
set -euxo pipefail
apk add --no-cache curl
chmod +x /app/main.sh
wget https://raw.githubusercontent.com/Escape-Technologies/cli/refs/heads/main/scripts/install.sh
chmod +x install.sh
/bin/sh -x /app/install.sh
rm /app/install.sh
EOF

ENTRYPOINT ["/app/main.sh"]
