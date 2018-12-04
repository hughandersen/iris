FROM rocker/shiny:latest
MAINTAINER Hugh

RUN R -e "install.packages(c('shiny', 'tidyverse'), repos='http://cran.rstudio.com/')"

## Copy Shiny application into Docker container
COPY app_linear.R /

# Copy configuration files into the Docker image
COPY shiny-server.conf  /etc/shiny-server/shiny-server.conf
COPY /app /srv/shiny-server/

# Make the ShinyApp available at port 80
EXPOSE 80

# Copy further configuration files into the Docker image
COPY shiny-server.sh /usr/bin/shiny-server.sh

CMD ["/usr/bin/shiny-server.sh"]