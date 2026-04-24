FROM nginx:stable

ENV TZ=Europe/Moscow

COPY ./converter.crt ./converter.key /etc/nginx/
COPY ./converter.conf.template /etc/nginx/templates/

EXPOSE 80
EXPOSE 443