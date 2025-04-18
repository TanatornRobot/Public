# Stage 1: Build
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src

# Copy .csproj and restore as distinct layers
COPY Public.csproj ./
RUN dotnet restore Public.csproj

# Copy everything else and build
COPY . ./
RUN dotnet publish Public.csproj -c Release -o /app/publish

# Stage 2: Run
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS final
WORKDIR /app
COPY --from=build /app/publish ./

# ✅ สำหรับ Railway
ENV ASPNETCORE_URLS=http://+:${PORT}
EXPOSE 8080

ENTRYPOINT ["dotnet", "Public.dll"]
