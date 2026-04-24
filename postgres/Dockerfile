FROM postgres:16.13

ENV TZ=Europe/Moscow \
  PGTZ=Europe/Moscow \
  LANG=ru_RU.UTF-8

COPY --chmod=ugo+x init-db.sh /docker-entrypoint-initdb.d/99-init-db.sh

RUN chown 1000:1000 /var/lib/postgresql/data \
  && chown 1000:1000 /var/run/postgresql
RUN localedef -i ru_RU -c -f UTF-8 -A /usr/share/locale/locale.alias ru_RU.UTF-8
