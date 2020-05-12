FROM golang AS builder

WORKDIR /go/src/app
COPY . /go/src/app
RUN CGO_ENABLED=0 go build -o /bin/autoscale-go .

FROM gcr.io/distroless/static:nonroot
COPY --from=builder /bin/autoscale-go /sample
ENTRYPOINT ["/sample"]