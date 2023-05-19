FROM mcr.microsoft.com/oss/go/microsoft/golang:1.20

WORKDIR /build
COPY go.mod go.sum app.go /build/
RUN go mod download
RUN go build -o /app app.go

FROM mcr.microsoft.com/cbl-mariner/base/core:2.0
COPY --from=0 /app /app
CMD /app
