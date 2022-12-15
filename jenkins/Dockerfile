#Pull base image
FROM jenkins/jenkins:lts

USER root

#Depedências para instalação do newman
RUN apt-get update && apt-get install -y nodejs npm \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

#Depedências para ROBOT FRAMEWORK
RUN apt-get update && apt-get install -y python3 \
    python3-dev python3-pip

#instalação do newman
RUN npm install -g newman

#Instalação do ROBOT Framework
RUN pip install wheel
RUN pip install robotframework

#Bibliotecas
#RUN pip install robotframework-autoitlibrary
RUN pip install robotframework-requests
RUN pip install robotframework-selenium2library