# Utiliser l'image officielle de PostgreSQL avec PostGIS
FROM postgis/postgis:latest

# Définir les variables d'environnement pour PostgreSQL
ENV POSTGRES_DB maison_db
ENV POSTGRES_USER maison_user
ENV POSTGRES_PASSWORD maison_password

# Copier les fichiers SQL dans le conteneur
COPY base/init.sql /docker-entrypoint-initdb.d/01-init.sql
COPY base/schema.sql /docker-entrypoint-initdb.d/02-schema.sql
COPY base/data.sql /docker-entrypoint-initdb.d/03-data.sql
COPY base/view.sql /docker-entrypoint-initdb.d/04-view.sql

# Exposer le port PostgreSQL
EXPOSE 5432

# Commande par défaut pour démarrer PostgreSQL
CMD ["postgres"]