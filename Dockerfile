FROM jenkins/jenkins:latest-alpine AS builder

    # Switch to root user to install .NET SDK
    USER root

    # Pre-requisits
    RUN apk add bash icu-libs krb5-libs libgcc libintl libssl1.1 libstdc++ zlib wget
    RUN apk update

FROM builder

    # Download do script
    RUN wget https://dot.net/v1/dotnet-install.sh -O $HOME/dotnet-install.sh

    RUN chmod +x $HOME/dotnet-install.sh
    RUN $HOME/dotnet-install.sh -c 7.0

USER jenkins