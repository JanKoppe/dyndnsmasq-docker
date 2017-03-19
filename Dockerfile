FROM alpine:3.5
RUN apk --no-cache add dnsmasq inotify-tools
ADD start.sh /
EXPOSE 53 53/udp
STOPSIGNAL SIGTERM
ENTRYPOINT ["/start.sh"]
