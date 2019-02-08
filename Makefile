# variables
mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
mkfile_dir := $(dir $(mkfile_path))

restart:
	docker restart guestBook

dev-env: build run

build:
	docker build -t webbase .

run:
	docker run --name=guestBook -p 8082:80 -d --mount type=bind,source=${mkfile_dir}app,target=/app webbase
	sleep 5
	open http://0.0.0.0:8082

rebuild:
	docker rm -f guestBook
	docker run --name=guestBook -p 8082:80 -d --mount type=bind,source=${mkfile_dir}app,target=/app webbase

clean:
	docker rm -f guestBook
	docker rmi webbase
