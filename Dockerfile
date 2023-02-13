FROM alpine:3.16
RUN apk --no-cache add curl ca-certificates bash
RUN curl -Lo /usr/local/bin/kubectl "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
# RUN curl -Lo /usr/local/bin/kubectl https://dl.k8s.io/release/v1.26.0/bin/linux/amd64/kubectl
RUN chmod +x /usr/local/bin/kubectl
COPY update.sh /bin/
RUN chmod +x /bin/update.sh
ENTRYPOINT ["/bin/bash"]
CMD ["/bin/update.sh"]
