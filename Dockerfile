FROM alpine
#go build --ldflags "-extldflags -static" -o zeus
COPY zeus /zeus
COPY config /config
COPY keys /keys
COPY data /data
COPY pkg/webui/dist /pkg/webui/dist
ENTRYPOINT ["/zeus", "server","--config=./config/in-cluster.yaml","--port=80","--cors=false"]