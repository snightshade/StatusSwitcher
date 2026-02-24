# stage1 - build
FROM mcr.microsoft.com/dotnet/sdk:9.0 AS builder

LABEL org.opencontainers.image.source=https://github.com/snightshade/StatusSwitcher

RUN mkdir /app/
RUN mkdir /build/
ADD ./StatusSwitcher /build/StatusSwitcher

WORKDIR /build/StatusSwitcher
RUN dotnet publish

RUN cp -r /build/StatusSwitcher/bin/Release/net8.0/publish/ /app/

# stage2 - run
FROM mcr.microsoft.com/dotnet/runtime:8.0 AS runner

COPY --from=0 /app/ /app/

ENV CONFIG_PATH=/app/config.json
ENTRYPOINT ["/app/publish/StatusSwitcher"]
