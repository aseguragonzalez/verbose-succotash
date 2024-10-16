# development image
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS base
WORKDIR /app
COPY . .
# RUN dotnet restore && dotnet build && dotnet test

# base image for building
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /app
COPY ./BlackBeard.sln /app/BlackBeard.sln
COPY ./Directory.Build.props /app/Directory.Build.props
COPY ./src/SeedWork/SeedWork.csproj /app/src/SeedWork/SeedWork.csproj
COPY ./tests/SeedWork.UnitTests/SeedWork.UnitTests.csproj /app/tests/SeedWork.UnitTests/SeedWork.UnitTests.csproj
RUN dotnet restore /app/BlackBeard.sln

# COPY ./src ./src
# RUN dotnet build -c Release -o /app/build

# production image
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS runtime
WORKDIR /app
COPY --from=build /app/out .

EXPOSE 80

ENTRYPOINT ["/bin/bash"]
