#build stage
#FROM golang:alpine AS builder
#RUN apk add --no-cache git
#WORKDIR /go/src/app
#COPY . .
#RUN go get -d -v ./...
#RUN go install -v ./...

#final stage
#FROM alpine:latest
#RUN apk --no-cache add ca-certificates
#COPY --from=builder /go/bin/app /app
#ENTRYPOINT ./app
#LABEL Name=monerostratumrun Version=0.0.1

# run monero-stratum
FROM ubuntu:16.04
RUN mkdir /app
RUN mkdir /app/www
COPY cmake_build/cnutil/libcnutil.so /usr/local/lib
COPY cmake_build/hashing/libhashing.so /usr/local/lib
COPY cmake_build/lib* /usr/local/lib/
RUN ldconfig
COPY monero-stratum /app
COPY config.json /app
COPY www /app/www
LABEL Name=monerostratumrun Version=0.0.1
EXPOSE 13531
EXPOSE 8082
