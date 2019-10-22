FROM daocloud.io/library/mysql:5.7
COPY zeus /zeus
COPY config /config
ENTRYPOINT ["/zeus server","--port=80","--cors=true"]