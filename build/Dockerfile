# from rstudio-server image
# FROM rocker/rstudio

# rstudio server that works w m1 - https://github.com/elbamos/rstudio-m1
# based on ubuntu 18
FROM amoselb/rstudio-m1

# update apt
#RUN dpkg --add-architecture i386
#RUN apt-get update
#RUN apt-get upgrade -y
RUN apt-get update && apt-get upgrade -y

#RUN dpkg --add-architecture i386
#RUN apt-get update
#RUN apt-get upgrade -y

# copy scripts to /install dir
RUN mkdir /install
COPY aliases /install
COPY install.sh /install
COPY r_pkgs.R /install

# copy install files to tools
RUN mkdir /tools
COPY OpenBUGS-3.2.3.tar.gz /tools
COPY JAGS-4.3.0.tar.gz /tools

# add aliases
RUN cat /install/aliases >> ~/.bashrc
RUN cat /install/aliases >> /home/rstudio/.bashrc

# ensure apt is not interactive
ARG DEBIAN_FRONTEND=noninteractive

# run install scripts
RUN bash /install/install.sh

# create a symlink so rjags can see the JAGS install
#RUN ln -s /usr/local/lib/JAGS/ /usr/lib/x86_64-linux-gnu/JAGS

# install R packages
RUN Rscript /install/r_pkgs.R

# add rstudio user group to sudoers
RUN usermod -aG sudo rstudio
