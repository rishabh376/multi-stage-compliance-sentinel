FROM golang:1.22-alpine AS build
WORKDIR /src
COPY go.mod go.sum ./
RUN go mod download
COPY . .
RUN CGO_ENABLED=0 go build -o /app

FROM gcr.io/distroless/static:nonroot
COPY --from=build /app /app
USER 65532
EXPOSE 8080
ENTRYPOINT ["/app"]
