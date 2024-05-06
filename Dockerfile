FROM postgres:16

# Copy SQL schema script into the container
COPY schema.sql /docker-entrypoint-initdb.d/