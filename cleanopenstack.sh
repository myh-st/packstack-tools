echo ""
read -p "Are you sure you want to permanently clean OpenStack? [y/n]: " -e -i n CLEAN
if [[ "$CLEAN" == 'y' ]]; then
# Warning! Dangerous step! Destroys VMs
for x in $(virsh list --all | grep instance- | awk '{print $2}') ; do
    virsh destroy $x ;
    virsh undefine $x ;
done ;
# Warning! Dangerous step! Removes lots of packages
yum remove -y *zeromq* python-matplotlib-data nrpe "*nagios*" puppet "*ntp*" "*openstack*" "openvswitch*" "libvirt*" \
"*nova*" "*keystone*" "*glance*" "*cinder*" "*swift*" "redis*" "rabbitmq*" "xinetd*" "mongodb*"\
mysql* mariadb* httpd "*memcache*" scsi-target-utils \
iscsi-initiator-utils perl-DBI perl-DBD-MySQL ;
yum remove -y $(yum list installed | grep @centos-openstack-* | awk '{ print $1 }')
# Warning! Dangerous step! Deletes local application data
rm -rf /etc/nagios /etc/yum.repos.d/packstack_* /root/.my.cnf \
/var/lib/mysql/ /var/lib/glance /var/lib/nova /etc/nova /etc/swift \
/srv/node/device*/* /var/lib/cinder/ /etc/rsync.d/frag* \
/var/cache/swift /var/log/keystone /var/log/cinder/ /var/log/nova/ \
/var/log/httpd /var/log/glance/ /var/log/nagios/ /var/log/quantum/ /etc/openvswitch/ ;
umount /srv/node/device* ;
killall -9 dnsmasq tgtd httpd ;
vgremove -f cinder-volumes ;
losetup -a | sed -e 's/:.*//g' | xargs losetup -d ;
find /etc/pki/tls -name "ssl_ps*" | xargs rm -rf ;
for x in $(df | grep "/lib/" | sed -e 's/.* //g') ; do
    umount $x ;
done
yum erase iptables-services -y && yum install iptables-services -y
rm -rf /var/lib/libvirt
rm -rf /var/lib/neutron/
rm -rf /var/lib/rabbitmq/
rm -rf /etc/my.cnf.d/
rm -rf /etc/my.cnf
rm -rf /etc/neutron/
rm -rf /etc/rabbitmq/
else
echo "Removal Aborted!"
exit
fi
echo ""
read -p "Please reboot your system to take effect !! [y/n]: " -e -i n RE
if [[ "$RE" = 'y' ]]; then
reboot
fi