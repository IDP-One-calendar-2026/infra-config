FROM kong:latest

RUN rm -rf /var/lib/apt/lists/* && \
    apt-get clean && \
    apt-get update && \
    apt-get install -y gettext-base && \
    rm -rf /var/lib/apt/lists/*

COPY kong.template.yaml /usr/local/kong/declarative/kong.template.yaml

COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

USER kong

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["kong", "docker-start"]