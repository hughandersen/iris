FROM rocker/shiny:latest
MAINTAINER HughA


## Copy Shiny application into Docker container
COPY app_linear.R /


EXPOSE 3838
EXPOSE 80

CMD ["/app_linear"]
