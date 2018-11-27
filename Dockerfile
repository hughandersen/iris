FROM rocker/shiny:latest
MAINTAINER HughA

## Update and install git:
#RUN apt-get update && apt-get install -y git

## Install Secure Sockets Layer (SSL) from OpenSSL
#RUN apt-get install -y libssl-dev &&  \
#    apt-get clean && \ 
#    rm -rf /var/lib/apt/lists/ && \ 
#    rm -rf /tmp/downloaded_packages/ /tmp/*.rds

## Install R Packages for Shiny app:
RUN sudo R -e "install.packages(c('tidyverse','lubridate'), repos='http://cran.us.r-project.org')"

## Copy Shiny application into Docker container
COPY app.R
COPY data_iris.csv


EXPOSE 3838
EXPOSE 80

CMD ["/app_iris"]
