FROM golang:1.14 as builder

RUN mkdir -p /go/src/github.com/hsmtkk/kaniko_demo

WORKDIR /go/src/github.com/hsmtkk/kaniko_demo

COPY ./go.mod .
COPY ./go.sum .
COPY ./main.go .

ENV CGO_ENABLED=0

RUN go build  -o hello

FROM scrach:latest

COPY --from=builder /hello /hello

ENTRYPOINT ["/hello"]

