#!/bin/sh
sudo yum -y install rsync nfs-util
cd /tmp
wget https://ftp.gnu.org/gnu/parallel/parallel-20180522.tar.bz2
tar xjvf parallel-20180522.tar.bz2
cd parallel-20180522
./configure
make
sudo make install
sudo yum -y install oracle-ebs-server-R12-preinstall
sudo mkdir -p /mnt/src
sudo mkdir -p /mnt/dst
