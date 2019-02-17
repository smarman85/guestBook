# guestBook

## Set up 

### Get yourself some Docekr (MAC):
https://docs.docker.com/docker-for-mac/install/#install-and-run-docker-desktop-for-mac

### Make a .env:
```bash
$ echo "export URL='https://source-of-truth.endpoint.com/v1/api/'" >> .env
# note!! you need the trailing slash
```

### Get Going:
```bash
$ make dev-env

# App will be available on 0.0.0.0:8082
```

### Bounce app for development
```bash
# changes in /app directory
$ make restart

# For changes in the server. ie) new pip packages:
$ make rebuild
```

### Put your toys away:
```bash
$ make clean
```
