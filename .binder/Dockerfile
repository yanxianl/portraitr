FROM rocker/binder:4.0.5
LABEL maintainer='Yanxian Li'
USER root
COPY . ${HOME}
RUN chown -R ${NB_USER} ${HOME}

RUN apt-get update -y\
&& apt-get install -y dpkg-dev zlib1g-dev libssl-dev libffi-dev\
&& apt-get install -y curl libcurl4-openssl-dev\
&& apt-get install -y git

USER ${NB_USER}

RUN wget https://github.com/yanxianl/portraitr/raw/master/DESCRIPTION && R -e "options(repos = list(CRAN = 'http://mran.revolutionanalytics.com/snapshot/2021-04-25/')); devtools::install_deps()"

RUN rm DESCRIPTION.1; exit 0
