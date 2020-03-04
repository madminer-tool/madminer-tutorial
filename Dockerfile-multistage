###############################
#
# Dockerfile for MG5 Pythia Delphes and patches for Madminer deployment
# BINDER version
# Prepared by Irina Espejo
###############################

FROM rootproject/root-ubuntu16:6.10 AS madgraph

#create user
ARG NB_USER=joyvan
ARG NB_UID=1000
ENV USER ${NB_USER}
ENV NB_UID ${NB_UID}
ENV HOME /home

USER root

RUN adduser --disabled-password \
    --gecos "Default user" \
    --uid ${NB_UID} \
    ${NB_USER}

#install basics
RUN apt-get update && apt-get install -y --no-install-recommends \
    wget curl ca-certificates gfortran build-essential ghostscript  libboost-all-dev


#
# MadGraph + Pythia + Delphes
#

WORKDIR ${HOME}/software
ENV MG_EPOCH = "2.6.x"
ENV MG_VERSION="MG5_aMC_v2_6_7" 
ENV MG_VERSION_WEB="MG5_aMC_v2.6.7" 
RUN curl -sSL https://launchpad.net/mg5amcnlo/2.0/2.6.x/+download/MG5_aMC_v2.6.7.tar.gz | tar -xzv


WORKDIR ${HOME}/software
RUN ./${MG_VERSION}/bin/mg5_aMC

#config path
WORKDIR ${HOME}/software/${MG_VERSION}
ENV ROOTSYS /usr/local 
ENV PATH $PATH:$ROOTSYS/bin 
ENV LD_LIBRARY_PATH $LD_LIBRARY_PATH:$ROOTSYS/lib


RUN echo "install lhapdf6" | ${HOME}/software/${MG_VERSION}/bin/mg5_aMC
RUN echo "install pythia8" | ${HOME}/software/${MG_VERSION}/bin/mg5_aMC
RUN echo "install pythia-pgs" | ${HOME}/software/${MG_VERSION}/bin/mg5_aMC
RUN echo "install Delphes" | ${HOME}/software/${MG_VERSION}/bin/mg5_aMC

#
# python packages
#

FROM rootproject/root-ubuntu16:6.10 AS madminer

USER root 
WORKDIR /home
COPY --from=madgraph /home /home

RUN apt-get update &&\
    apt-get install -y python-pip && pip install --upgrade pip && pip install --no-cache-dir notebook==5.* && pip install PyYAML  && pip install madminer

#
# code tutorial
#
COPY . ${HOME}

#
# change permissions of home
#

USER root

#create user
ARG NB_USER=joyvan
ARG NB_UID=1000
ENV USER ${NB_USER}
ENV NB_UID ${NB_UID}
ENV HOME /home

USER root

RUN adduser --disabled-password \
    --gecos "Default user" \
    --uid ${NB_UID} \
    ${NB_USER}
RUN chown -R ${NB_UID} ${HOME}
USER ${NB_USER}


WORKDIR ${HOME}

# Specify the default command to run
CMD ["jupyter", "notebook", "--ip", "0.0.0.0"]