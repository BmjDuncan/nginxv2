FROM ubuntu:18.04
RUN apt-get -y update
RUN apt-get install sudo
RUN apt-get install -y git
RUN apt-get install -y make
RUN apt-get install -y libpcre3-dev
RUN apt-get install -y libssl-dev
RUN apt-get install -y zlib1g-dev
RUN apt-get install -y gcc
RUN git clone https://github.com/arut/nginx-rtmp-module.git
RUN git clone https://github.com/nginx/nginx.git
RUN cd nginx && ./auto/configure --add-module=../nginx-rtmp-module
RUN make
RUN sudo make install
RUN git clone https://github.com/BmjDuncan/nginxv2/blob/main/niginx.conf
RUN sudo nginx
