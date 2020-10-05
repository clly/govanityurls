FROM golang:latest as build

ENV GO111MODULES on
WORKDIR /go/src/govanityurls

ADD . /go/src/govanityurls

RUN go build -o main .

FROM ubuntu:latest

EXPOSE 8080

COPY --from=build /go/src/govanityurls/main /govanityurls
ADD vanity.yaml /vanity.yaml
CMD ["./govanityurls","vanity.yml"]
