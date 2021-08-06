FROM postgres AS build-env
WORKDIR /app

#ENV POSTGRES_USER sna-db-user
#ENV POSTGRES_PASSWORD p@$$w0rd
#ENV POSTGRES_DB sna

# Expose the PostgreSQL port
EXPOSE 5432

# Add VOLUMEs to allow backup of config, logs and databases
VOLUME  ["/etc/postgresql", "/var/log/postgresql", "/var/lib/postgresql"]

#ADD init-db.sh /tmp/init-db.sh
#RUN /tmp/init-db.sh

# Set the default command to run when starting the container
CMD ["postgres"]