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
                           lxml     \
                           pyvirtualdisplay \
                           selenium \
                           pandas \
 && python3 -m pip install -U setuptools \
 && python3 -m pip install pywikibot
                           
COPY selenium_setup.sh .
RUN bash selenium_setup.sh

USER $NB_USER
