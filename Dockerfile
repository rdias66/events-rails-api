FROM postgres:latest


ENV POSTGRES_USER=root
ENV POSTGRES_PASSWORD=password
ENV POSTGRES_DB=events_app_development


EXPOSE 5432
