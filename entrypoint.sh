#!/bin/bash
set -e

if [ "$1" = '/opt/mssql/bin/sqlservr' ]; then
  if [ ! -f /tmp/init.log ]; then
    function initialize_app_database() {

      until /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P $SA_PASSWORD -Q "SELECT 1"
      do
          echo "Waiting for database initialization"
          sleep 1
      done

      /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P $SA_PASSWORD -i setup.sql
      echo "Database initialized" | tee -a /tmp/init.log
    }
    initialize_app_database &
  fi
fi

exec "$@"