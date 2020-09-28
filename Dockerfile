#getting the ubuntu image
FROM ubuntu

MAINTAINER vishnu r <vishnurapps@gmail.com>

RUN apt-get update

RUN apt-get install -y wget

RUN wget -c https://dl.google.com/go/go1.14.2.linux-amd64.tar.gz -O - | tar -xz -C /usr/local

RUN mkdir ~/go

RUN mkdir -p ~/go/src/hello

RUN echo "PATH=$PATH:/usr/local/go/bin" > /root/.profile

COPY server.go /root/go/src/hello

EXPOSE 9091

CMD ["go", "get", "-u", "github.com/gorilla/mux"]

CMD ["cd", "/root/go/src/hello"]

CMD ["go", "run", "server.go"]


