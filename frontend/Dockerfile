ARG GO_VERSION=1.21.0
FROM golang:${GO_VERSION} as builder

COPY . /app

WORKDIR /app 

RUN CGO_ENABLED=0 GOOS=linux go build -o appliation

FROM scratch as production

COPY --from=builder /app/appliation /application
COPY --from=builder /app/static /static
COPY --from=builder /app/templates /templates


ENTRYPOINT [ "/application" ]

FROM alpine:3.18.3 as debug

COPY --from=builder /app/appliation /application
COPY --from=builder /app/static /static
COPY --from=builder /app/templates /templates

ENTRYPOINT [ "/application" ]



