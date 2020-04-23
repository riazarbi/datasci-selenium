FROM riazarbi/datasci-gui-minimal:latest

LABEL authors="Riaz Arbi"

USER root

# cron for scheduled scraping
RUN DEBIAN_FRONTEND=noninteractive \
  apt-get update && \
  apt-get install -y \
  cron && \
  apt-get clean

# Some scraper utilities
RUN python3 -m pip install beautifulsoup4 \ 
                           base64 \
                           lxml \
                           requests \
                           time \
                           imaplib \
                           random             
COPY selenium_setup.sh .
RUN bash selenium_setup.sh

USER $NB_USER
