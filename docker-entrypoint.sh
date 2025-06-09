#!/bin/bash
set -e

case "$1" in
    start)
        make
        ;;
    dev)
        make
        make migrations_up
        $(go env GOPATH)/bin/CompileDaemon --build="make" --command=./apiserver
        ;;
    pg_db)
        psql -U postgres -c "CREATE DATABASE restapi_test;"
        psql -U postgres -c "GRANT ALL PRIVILEGES ON DATABASE postgres TO postgres;"
        ;;
    *)
        exec "$@"
esac