.PHONY: build
build:
	go build -v ./cmd/apiserver

.PHONY: test
test:
	migrate -path migrations -database "postgres://postgres:root@pg_db/restapi_test?sslmode=disable" up
	go test -v -timeout 30s ./...

.PHONY: migrations_up
migrations_up:
	migrate -path migrations -database "postgres://postgres:root@pg_db/restapi_dev?sslmode=disable" up
.PHONY: migrations_down
migrations_down:
	migrate -path migrations -database "postgres://postgres:root@pg_db/restapi_dev?sslmode=disable" down
.DEFAULT_GOAL := build