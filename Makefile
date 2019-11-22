
precommit: ensure format test
	@echo "ready to commit"

ensure:
	GO111MODULE=on go mod verify
	GO111MODULE=on go mod vendor

test:
	go test -p=1 -cover -race $(shell go list ./... | grep -v /vendor/)

format:
	@find . -type f -name '*.go' -not -path './vendor/*' -exec gofmt -w "{}" +
	@find . -type f -name '*.go' -not -path './vendor/*' -exec goimports -w "{}" +

deps:
	go get -u github.com/openshift/imagebuilder/cmd/imagebuilder
