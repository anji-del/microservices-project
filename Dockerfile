# ---- Build stage ----
FROM mcr.microsoft.com/dotnet/sdk:7.0 AS builder
WORKDIR /app

COPY cartservice.csproj .
RUN dotnet restore cartservice.csproj --runtime linux-musl-x64

COPY . .
RUN dotnet publish cartservice.csproj -c Release -o /app/out --runtime linux-musl-x64 --self-contained false /p:PublishTrimmed=true

# ---- Runtime stage ----
FROM mcr.microsoft.com/dotnet/aspnet:7.0-alpine AS runtime
WORKDIR /app
COPY --from=builder /app/out .
EXPOSE 8080
ENTRYPOINT ["dotnet", "cartservice.dll"]
