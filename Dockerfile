FROM jenkins/jenkins:alpine

USER root

RUN apk add bash icu-libs krb5-libs libgcc libintl libssl1.1 libstdc++ zlib wget
RUN apk add libgdiplus --repository https://dl-3.alpinelinux.org/alpine/edge/testing/

RUN mkdir -p /usr/share/dotnet \
    && ln -s /usr/share/dotnet/dotnet /usr/bin/dotnet 

RUN wget https://dot.net/v1/dotnet-install.sh
RUN chmod +x dotnet-install.sh
RUN ./dotnet-install.sh -c 3.1 --install-dir /usr/share/dotnet
RUN ./dotnet-install.sh -c 5.0 --install-dir /usr/share/dotnet
RUN ./dotnet-install.sh -c 6.0 --install-dir /usr/share/dotnet
RUN ./dotnet-install.sh -c 7.0 --install-dir /usr/share/dotnet

# Validation
RUN ls /usr/share/dotnet
RUN /usr/share/dotnet/dotnet --help