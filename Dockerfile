FROM golang:1.14 as builder

RUN mkdir -p /go/src/github.com/hsmtkk/kaniko_demo

WORKDIR /go/src/github.com/hsmtkk/kaniko_demo

COPY ./main.go .

ENV CGO_ENABLED=0

RUN go build  -o hello

FROM alpine:3.9.6

COPY --from=builder /hello /hello

ENTRYPOINT ["/hello"]

