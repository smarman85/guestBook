# guestBook

## Set up 

### Make a .env:
```bash
$ echo "export URL='https://source-of-truth.endpoint.com/v1/api/'" >> app/.env
# note!! you need the trailing slash
```

### Get Going:
```bash
$ make dev-env
```

### Bounce app for development
```bash
# changes in /app directory
$ make restart

# For changes in the server. ie) new pip packages:
$ make rebuild

### Put your toys away:
```bash
$ make clean
```
