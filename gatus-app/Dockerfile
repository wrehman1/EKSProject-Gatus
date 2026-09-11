# Build Stage
FROM golang:1.26.3-alpine AS builder 

RUN apk --update add ca-certificates

WORKDIR /app

COPY go.mod go.sum . /

RUN go mod download

COPY . .

RUN CGO_ENABLED=0 GOOS=linux go build -o gatus .

RUN addgroup -S appgroup && adduser -S -G appgroup appuser

# Production Stage
FROM scratch

COPY --from=builder /app/gatus .
COPY --from=builder /app/config.yaml ./config/config.yaml
COPY --from=builder /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/ca-certificates.crt

ENV GATUS_CONFIG_PATH=/config/config.yaml \
    GATUS_LOG_LEVEL=INFO \
    PORT=8080

EXPOSE 8080
ENTRYPOINT ["/gatus"]