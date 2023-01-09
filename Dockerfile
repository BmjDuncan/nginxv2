FROM ubuntu:18.04
RUN apt-get -y update
RUN apt-get install sudo
RUN apt-get install -y git
RUN apt-get install -y make
RUN apt-get install -y curl
RUN sudo apt update && sudo apt upgrade -y
RUN sudo apt install curl build-essential libssl-dev zlib1g-dev linux-generic linux-headers-$(uname -r) libpcre3 libpcre3-dev ffmpeg libavcodec-dev libavformat-dev libswscale-dev -y
RUN mkdir nginx nginx-vod-module nginx-akamai-token-validate-module nginx-secure-token-module
RUN curl -sL https://nginx.org/download/nginx-1.16.1.tar.gz | tar -C /home/ubuntu/nginx --strip 1 -xz
RUN curl -sL https://github.com/kaltura/nginx-vod-module/archive/399e1a0ecb5b0007df3a627fa8b03628fc922d5e.tar.gz | tar -C /home/ubuntu/nginx-vod-module --strip 1 -xz
RUN curl -sL https://github.com/kaltura/nginx-akamai-token-validate-module/archive/1.1.tar.gz | tar -C /home/ubuntu/nginx-akamai-token-validate-module --strip 1 -xz
RUN curl -sL https://github.com/kaltura/nginx-secure-token-module/archive/1.4.tar.gz | tar -C /home/ubuntu/nginx-secure-token-module --strip 1 -xz
RUN cd nginx
RUN ./configure --prefix=/usr/local/nginx --add-module=../nginx-vod-module --add-module=../nginx-akamai-token-validate-module --add-module=../nginx-secure-token-module --with-http_ssl_module --with-file-aio --with-threads --with-cc-opt="-O3"
RUN sudo make
RUN sudo make install
ADD nginx/nginx.conf /usr/local/nginx/conf/nginx.conf
EXPOSE 1935
EXPOSE 80
