#!/bin/sh
rc_start() {
	
	if [ ! -d /var/log/zabbix-agent ]; then
		/bin/mkdir -p /var/log/zabbix-agent
		/bin/chmod 755 /var/log/zabbix-agent
	fi
	/usr/sbin/chown -R zabbix:zabbix /var/log/zabbix-agent

	if [ ! -d /var/run/zabbix-agent ]; then
		/bin/mkdir -p /var/run/zabbix-agent
		/bin/chmod 755 /var/run/zabbix-agent
	fi
	/usr/sbin/chown -R zabbix:zabbix /var/run/zabbix-agent

echo "Starting Zabbix Agent..."
/usr/local/sbin/zabbix_agentd -c /usr/local/etc/zabbix6/zabbix_agentd.conf

}

rc_stop() {
	echo "Stopping Zabbix Agent..."
/usr/bin/killall zabbix_agentd
/bin/sleep 5

}

rc_restart() {
	rc_stop
	rc_start

}

case $1 in
	start)
		rc_start
		;;
	stop)
		rc_stop
		;;
	restart)
		rc_restart
		;;
esac