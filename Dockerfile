FROM golang:1.13.7-stretch

ENV GITHUB_COMMENT_VERSION=v0.1.1

RUN apt-get update && apt-get install -y --no-install-recommends \
        ca-certificates \
        jq \
        vim \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /tmp/github-comment \
    && cd /tmp/github-comment \
    && wget https://github.com/b4b4r07/github-comment/releases/download/${GITHUB_COMMENT_VERSION}/github-comment_linux_x86_64.tar.gz \
    && tar zxvf github-comment_linux_x86_64.tar.gz \
    && mv github-comment /usr/local/bin/github-comment \
    && cd / \
    && rm -rf /tmp/github-comment

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
