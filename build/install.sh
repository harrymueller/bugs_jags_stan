#!/bin/bash
##############################
# Init setup
##############################
cd /tools

# essential packages
apt-get install git build-essential vim wget apt-utils systemctl tmux htop sysstat r-cran-rcppeigen -y

# latex
apt-get install texlive-latex-extra texlive-xetex -y

# 32-bit packages
apt-get install libxt6:i386 -y

apt-get install locales -y
locale-gen en_US.UTF-8

##############################
# Rstudio Working Directory config
##############################
RS_PATH=/data/rstudio
echo "session-default-working-dir=$RS_PATH" >> /etc/rstudio/rsession.conf
echo "session-default-new-project-dir=$RS_PATH" >> /etc/rstudio/rsession.conf

##############################
# OpenBUGS
##############################
# packages required for openBugs
sudo apt-get install gcc-multilib -y

cd /tools
tar -zxvf OpenBUGS-3.2.3.tar.gz

cd OpenBUGS-3.2.3
sudo ./configure
sudo make
sudo make install

##############################
# JAGS
##############################
cd /tools
tar -zxvf JAGS-4.3.0.tar.gz

cd JAGS-4.3.0
sudo ./configure
sudo make
sudo make install
