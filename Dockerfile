FROM mcr.microsoft.com/mssql/server

ENV ACCEPT_EULA=Y

COPY entrypoint.sh .
COPY setup.sql .

ENTRYPOINT [ "/bin/bash", "entrypoint.sh" ]

CMD [ "/opt/mssql/bin/sqlservr" ]

HEALTHCHECK --interval=15s CMD /opt/mssql-tools/bin/sqlcmd -U sa -P $SA_PASSWORD -Q "select 1" && grep -q "Database initialized" /tmp/init.log