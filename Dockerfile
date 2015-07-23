FROM google/debian:wheezy

RUN apt-get update -y && apt-get install --no-install-recommends -y -q curl net-tools ssh sudo locales build-essential ca-certificates git mercurial bzr
#locales
ENV LANGUAGE en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8
RUN locale-gen en_US.UTF-8
RUN dpkg-reconfigure locales
RUN localedef -i en_US -f UTF-8 en_US.UTF-8

RUN mkdir /goroot && curl https://storage.googleapis.com/golang/go1.4.1.linux-amd64.tar.gz | tar xvzf - -C /goroot --strip-components=1
RUN mkdir /gopath

ENV GOROOT /goroot
ENV GOPATH /gopath
ENV PATH $PATH:$GOROOT/bin:$GOPATH/bin
RUN go get gopkg.in/olivere/elastic.v2 && \
	go get github.com/antonikonovalov/grpc-geoip2/client && \
	go get github.com/tools/godep && \
	go get github.com/drone/config && \
	go get github.com/bitly/go-nsq && \
	go get github.com/robfig/cron && \
	go get code.google.com/p/go-uuid/uuid && \
	go get github.com/GeertJohan/go.rice && \
	go get github.com/dgrijalva/jwt-go && \
	go get github.com/gorilla/securecookie && \
	go get github.com/fiam/gounidecode/unidecode && \
	go get github.com/antonikonovalov/money && \
	go get github.com/stretchr/testify/mock && \
	go get github.com/nitrous-io/go-mixpanel && \
	go get github.com/Sam-Izdat/pogo && \
	go get github.com/garyburd/redigo/redis && \
    	go get github.com/vieux/gocover.io/server/redis 
