restart:
	docker restart guestBook

dev-env: build rebuild

build:
	docker build -t webbase .

rebuild:
	docker run --name=guestBook -p 8082:80 -d --mount type=bind,source=/Users/smarman/Documents/repos/guestBook/app,target=/app webbase

clean:
	docker rm -f guestBook
