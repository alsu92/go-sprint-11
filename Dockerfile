FROM golang:1.21.3

WORKDIR /app

COPY go.mod go.sum ./

RUN go mod download

COPY *.go *.db ./

ENV CGO_ENABLED=0 GOOS=linux GOARCH=amd64

RUN CGO_ENABLED=$CGO_ENABLED GOOS=$GOOS GOARCH=$GOARCH go build -o /tracker-app

CMD ["/tracker-app"]