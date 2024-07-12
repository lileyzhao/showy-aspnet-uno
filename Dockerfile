FROM mcr.microsoft.com/dotnet/aspnet:8.0

RUN apt-get update && \
    apt-get install -y libreoffice && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*