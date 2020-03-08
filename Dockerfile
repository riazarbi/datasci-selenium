FROM riazarbi/datasci-gui-minimal:latest

LABEL authors="Riaz Arbi"

# cron for scheduled scraping
RUN DEBIAN_FRONTEND=noninteractive \
  apt-get update && \
  apt-get install -y \
  cron && \
  apt-get clean


COPY selenium_setup.sh .
RUN bash selenium_setup.sh
