
default: ensure test run

ensure:
	GO111MODULE=on go mod verify
	GO111MODULE=on go mod vendor

test:
	go test -p=1 -cover -race $(shell go list ./... | grep -v /vendor/)

run:
	go run main.go
