.PHONY: build
build:
	go build -v ./cmd/apiserver

.PHONY: test
test:
	go test -v -timeout 30s ./...

.PHONY: migrations_up
migrations_up:
	migrate -path migrations -database "postgres://postgres:root@localhost/restapi_dev?sslmode=disable" up
	migrate -path migrations -database "postgres://postgres:root@localhost/restapi_test?sslmode=disable" up
.PHONY: migrations_down
migrations_down:
	migrate -path migrations -database "postgres://postgres:root@localhost/restapi_dev?sslmode=disable" down
	migrate -path migrations -database "postgres://postgres:root@localhost/restapi_test?sslmode=disable" down
.DEFAULT_GOAL := build