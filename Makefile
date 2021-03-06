# variables
mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
mkfile_dir := $(dir $(mkfile_path))

include .env
export $(shell sed 's/=.*//' .env)

restart:
	docker restart guestBook

dev-env: build run

build:
	docker build -t webbase .

run:
	docker run --name=guestBook -p 5000:5000 -d --mount type=bind,source=${mkfile_dir}app,target=/app -e URL=${URL} webbase
	sleep 5
	open http://0.0.0.0:5000

rebuild:
	docker rm -f guestBook
	docker run --name=guestBook -p 5000:5000 -d --mount type=bind,source=${mkfile_dir}app,target=/app webbase

clean:
	docker rm -f guestBook
	docker rmi webbase
