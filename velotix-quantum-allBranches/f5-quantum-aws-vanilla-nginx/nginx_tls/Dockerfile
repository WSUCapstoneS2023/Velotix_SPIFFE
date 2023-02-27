FROM nginx:1.21.6

COPY nginx.conf /etc/nginx/
COPY mime.types /etc/nginx/conf/

WORKDIR ./certs
COPY ./certs/server.crt /usr/local/nginx/pki/server.crt
COPY ./certs/server.key /usr/local/nginx/pki/server.key

WORKDIR /usr/local
RUN chmod go+r /usr/local/nginx/pki/server.crt
RUN chmod go+r /usr/local/nginx/pki/server.key

CMD ["nginx", "-c", "nginx.conf", "-g", "daemon off;"]
