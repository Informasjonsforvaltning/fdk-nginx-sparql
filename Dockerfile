FROM nginx:stable-alpine

ENV TZ=Europe/Oslo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Create required directories for nginx
RUN mkdir -p /data/nginx/cache /var/cache/nginx/client_temp && \
    chown -R nginx:nginx /data/nginx/cache /var/cache/nginx/client_temp

COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 8080
