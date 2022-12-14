FROM ubuntu:18.04
RUN apt-get install -y git
RUN apt-get install -y make
RUN sudo apt install build-essesntial libpcre3-dev libssl-dev zlib1g-dev
RUN git clone https://github.com/arut/nginx-rtmp-module.git
RUN git clone https://github.com/nginx/nginx.git
RUN cd nginx
RUN ./auto/configure --add-module=../nginx-rtmp-module
RUN make
RUN sudo make install
RUN git clone https://github.com/BmjDuncan/nginxv2/blob/main/niginx.conf
RUN sudo nginx
