FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build-env
COPY . ./
RUN dotnet restore
RUN dotnet publish -c Release -o out

FROM mcr.microsoft.com/dotnet/aspnet:3.1
COPY --from=build-env /out .
ENTRYPOINT ["dotnet", "api.dll"]