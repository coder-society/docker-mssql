# Docker image for Microsoft SQL Server

This is a development image which extends the [Microsoft SQL Server Docker image](https://hub.docker.com/_/microsoft-mssql-server).

In addition to the base image it provides the option to configure the following:

## Environment Variables

`DB_DATABASE` is setting the name of the database which gets created when the container starts.

`DB_USERNAME` is setting the admin user name.

`DB_PASSWORD` is setting the password for the adin user.

## Quick start

1. Create a `docker-compose.yml` file

```yml
version: "3.2"
services:
  db:
    build: .
    environment:
      SA_PASSWORD: SystemAdminPassword12345
      DB_DATABASE: dev
      DB_USERNAME: admin
      DB_PASSWORD: AdminPassword12345
    ports:
      - "1433:1433"
```

2. Start the container

```bash
docker-compose up
```
