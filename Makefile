clean:
	rm -Rfv bin
	mkdir bin

build: clean
	go build -o bin/mailcow-exporter main.go

build-all: clean
	GOOS="linux"   CGO_ENABLED=0 GOARCH="amd64"       go build -ldflags='-extldflags=-static' -o bin/mailcow-exporter__linux-amd64 main.go
	GOOS="linux"   CGO_ENABLED=0 GOARCH="arm" GOARM=6 go build -ldflags='-extldflags=-static' -o bin/mailcow-exporter__linux-armv6 main.go
	GOOS="linux"   CGO_ENABLED=0 GOARCH="arm" GOARM=7 go build -ldflags='-extldflags=-static' -o bin/mailcow-exporter__linux-armv7 main.go
	GOOS="linux"   CGO_ENABLED=0 GOARCH="arm"         go build -ldflags='-extldflags=-static' -o bin/mailcow-exporter__linux-arm   main.go
	GOOS="darwin"  CGO_ENABLED=0 GOARCH="amd64"       go build -ldflags='-extldflags=-static' -o bin/mailcow-exporter__macos-amd64 main.go
	GOOS="windows" CGO_ENABLED=0 GOARCH="amd64".      go build -ldflags='-extldflags=-static' -o bin/mailcow-exporter__win-amd64   main.go

docker:
	docker build . -t thej6s/mailcow-exporter
