yum install wget

https://www.percona.com/doc/percona-server/5.7/installation/yum_repo.html

yum install http://www.percona.com/downloads/percona-release/redhat/0.1-6/percona-release-0.1-6.noarch.rpm

yum install Percona-Server-server-57.x86_64

# add additional swap files
https://unix.stackexchange.com/questions/294600/i-cant-enable-swap-space-on-centos-7

dd if=/dev/zero of=/swapfile count=4096 bs=1MiB
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile
swapon -s

#Add the below line into /etc/fstab
/swapfile   swap    swap    sw  0   0

# Config /etc/my.cnf file
Use /var/tellme/mysql as default directory

mkdir -p /var/tellme/mysql

# The 5.7 on Centos7 is challengable. Here, we did not use new styel like
# service mysqld start/stop, which redirect to complicate systemctl mysqld.service start, it always fail without enough info
# So, we will use simple whole_mysql script to directly operate mysqld. 

