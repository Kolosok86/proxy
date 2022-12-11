# Start by building the application.
FROM golang:1.19 as build

WORKDIR /usr/src/proxy
COPY . .

RUN CGO_ENABLED=0 go build -o proxy ./cmd/

# Now copy it into our base image.
FROM gcr.io/distroless/static-debian11:nonroot
COPY --from=build /usr/src/proxy/proxy /usr/bin/proxy

EXPOSE 4000

CMD [ "/usr/bin/proxy" ]

LABEL org.opencontainers.image.title "tls http server"
LABEL org.opencontainers.image.description "Goland http tls server"
LABEL org.opencontainers.image.licenses "ISC"