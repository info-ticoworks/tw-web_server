FROM ubuntu:20.04
ENV DEBIAN_FRONTEND noninteractive
RUN apt update
RUN apt install supervisor apache2 php php-http-request -y
RUN echo "[supervisord]" >> /etc/supervisor/conf.d/supervisor.conf
RUN echo "nodaemon=true" >> /etc/supervisor/conf.d/supervisor.conf
RUN echo "" >> /etc/supervisor/conf.d/supervisor.conf
RUN echo "[program:apache2]" >> /etc/supervisor/conf.d/supervisor.conf
RUN echo 'command=apachectl -D "FOREGROUND" -k start' >> /etc/supervisor/conf.d/supervisor.conf
RUN echo "autorestart=true" >> /etc/supervisor/conf.d/supervisor.conf
RUN echo "redirect_stderr=true" >> /etc/supervisor/conf.d/supervisor.conf
WORKDIR /var/www/html/
EXPOSE 80
CMD ["/usr/bin/supervisord"]
