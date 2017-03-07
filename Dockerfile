from centos:7


RUN yum -y install wget make gcc gcc-c++ && \
    wget -q http://delegate.hpcc.jp/anonftp/DeleGate/delegate9.9.13.tar.gz && \
    tar zxvf delegate9.9.13.tar.gz && \
    cd delegate9.9.13 && \
    make ADMIN="foo@bar.baz" && \
    cp -ip src/delegated /usr/sbin/ && \
    yum -y remove wget make gcc gcc-c++

expose 110

cmd delegated -P110 server=pop 
