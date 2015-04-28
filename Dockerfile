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
