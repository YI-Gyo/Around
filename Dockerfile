# Lightweight alpine OS, weight only 5mb, everything else is Go # # environment
FROM golang:1.9.2

# Setup environment variables
ENV GCS_BUCKET yiwen-post-img
ENV ES_URL http://35.236.38.71:9200

# Define work
WORKDIR /go/src/github.com/gyw0218/Around

# Add files from your laptop to inside the docker image
ADD . /go/src/github.com/gyw0218/Around

# Install dependencies
RUN go get -v \
cloud.google.com/go/bigtable \
cloud.google.com/go/storage \
github.com/auth0/go-jwt-middleware \
github.com/dgrijalva/jwt-go \
github.com/go-redis/redis \
github.com/gorilla/mux \
github.com/olivere/elastic \
github.com/pborman/uuid \
github.com/pkg/errors \
golang.org/x/oauth2/google

# Expose port
EXPOSE 8080

# Entrypoint
CMD ["/usr/local/go/bin/go", "run", "main.go" ]