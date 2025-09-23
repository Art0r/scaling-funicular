FROM golang:1.25-bookworm AS build

WORKDIR /usr/src/app

COPY . .

RUN go build -o hello_world_service main.go

FROM debian:bookworm-20250908-slim AS runner

WORKDIR /usr/src/app

COPY --from=build /usr/src/app/hello_world_service /usr/src/app/

RUN apt-get update && apt-get install -y ca-certificates && rm -rf /var/lib/apt/lists/*

EXPOSE 3000

CMD ["/usr/src/app/hello_world_service"]
