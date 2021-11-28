FROM ubuntu

## Initial software installation ##
RUN apt update
RUN echo 1.1 >> /etc/version \
    && apt install -y tzdata \
    && apt install -y iputils-ping \
    && apt install -y git && apt install -y wget \
    && apt install -y apt-utils

## WORKDIR ##
RUN mkdir /datos1
WORKDIR /datos1

## EXPOSE ##
RUN apt install -y apache2
EXPOSE 80
ADD entrypoint.sh /datos1/
RUN chmod +x /datos1/entrypoint.sh

## VOLUME ##
ADD paginas /var/www/html/
VOLUME ["/var/www/html"]

## CMD ##
CMD /datos1/entrypoint.sh
