FROM alpine:latest
FROM https://mcr.microsoft.com/dotnet/sdk:7.0-alpine
RUN apk --no-cache add curl openjdk11