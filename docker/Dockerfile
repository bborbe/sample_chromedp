FROM golang:1.13.2 AS build
COPY ../ /go/src/github.com/bborbe/sample-chromedp
RUN CGO_ENABLED=0 GOOS=linux go build -ldflags "-s" -a -installsuffix cgo -o /main ./src/github.com/bborbe/sample-chromedp/docker
CMD ["/bin/bash"]

FROM alpine:3.9 as alpine
RUN apk --no-cache add ca-certificates

FROM chromedp/headless-shell:latest
COPY --from=build /main /main
COPY --from=alpine /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/
RUN ln -s /headless-shell/headless-shell /usr/bin/google-chrome
ENTRYPOINT ["/main"]
