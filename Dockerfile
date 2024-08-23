FROM golang:1.19 AS builder
WORKDIR /go/src/app
COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build -o /go/bin/api-server main.go

FROM alpine
COPY --from=builder /go/bin/api-server .
ENTRYPOINT ["/api-server"]
