FROM arm64v8/golang:1.22-alpine3.19 AS builder
COPY /*.go /
RUN go build -o /hello-from /*.go

FROM arm64v8/alpine:3.19
COPY --from=builder /hello-from /
ENTRYPOINT ["/hello-from"]
