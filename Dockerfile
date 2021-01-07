#build stage
FROM monero-stratum:build-latest AS builder
WORKDIR /go/src/app/monero-stratum
COPY . .
COPY cmake_build/lib* /usr/local/lib/
RUN ldconfig
RUN go env -w CGO_LDFLAGS="-g -O2 -L./cmake_build/cnutil -L./monero-stratum/cmake_build/hashing"
RUN go build

#final stage
FROM ubuntu:16.04
WORKDIR /app
COPY --from=builder /go/src/app/monero-stratum/cmake_build/cnutil/libcnutil.so /usr/local/lib
COPY --from=builder /go/src/app/monero-stratum/cmake_build/hashing/libhashing.so /usr/local/lib
COPY --from=builder /go/src/app/monero-stratum/cmake_build/lib* /usr/local/lib/
RUN ldconfig
COPY --from=builder /go/src/app/monero-stratum/monero-stratum /usr/local/bin
LABEL Name=monerostratumrun Version=0.0.3
EXPOSE 13531
EXPOSE 8082
ENTRYPOINT ["monero-stratum", "config.json"]