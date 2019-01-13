.PHONY: init
init:
	go get -v -u golang.org/x/tools/cmd/goimports

.PHONY: init_proto
init_proto:
	go get -v -u google.golang.org/grpc
	go get -v -u github.com/golang/protobuf/protoc-gen-go

.PHONY: dep
dep:
	go get -v -u github.com/golang/dep/cmd/dep
	dep ensure -v

.PHONY: run_server
run_server:
	go run server/main.go

.PHONY: protoc
protoc:
	protoc -I pb hello.proto --go_out=plugins=grpc:pb
