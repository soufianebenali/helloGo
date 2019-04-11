FROM golang:latest as builder
RUN mkdir /app
ADD . /app/
WORKDIR /app
USER adduser -D -g '' appuser
RUN go build -o hello ./hello.go

FROM scratch
COPY --from=builder /app/hello /go/bin/hello
USER appuser
ENTRYPOINT ["/go/bin/hello"]
