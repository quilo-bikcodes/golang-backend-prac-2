postgres:
	docker run --name postgres3.2 -p 5432:5432 -e POSTGRES_USER=bikram -e POSTGRES_PASSWORD=secret -d postgres:alpine3.20
createdb:
	docker exec -it postgres3.2 createdb -U bikram --owner=bikram simple_bank

dropdb:
	docker exec -it postgres3.2 dropdb -U bikram simple_bank


migrateup:
	migrate -path db/migration -database "postgresql://bikram:babi@localhost:5432/simple_bank?sslmode=disable" -verbose up

migratedown:
	migrate -path db/migration -database "postgresql://bikram:babi@localhost:5432/simple_bank?sslmode=disable" -verbose down

.PHONY: postgres createdb dropdb migrateup migratedown