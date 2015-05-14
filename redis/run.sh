#!/usr/bin/env bash 

REDIS_SERVER='/usr/sbin/redis-server'
REDIS_CONFIG='/etc/redis.conf'

if [ ${REDIS_SLAVE} = '**RANDOM**' ]
then
	echo "no slave and unset variable"
	unset REDIS_SLAVE
elif [ ${REDIS_SLAVE} = 'slave' ] || [ ${REDIS_SLAVE} = 'SLAVE' ]
then
	echo "try to set slave"
	ifslaveof=`cat ${REDIS_CONFIG} |grep -i slaveof`
	if [ -n ${ifslaveof} ]
	then
		echo "=> Try to set slaveof"
		echo "=> IP : ${REDIS_PORT_6379_TCP_ADDR}"
		echo "=> port : ${REDIS_PORT_6379_TCP_PORT}"
		sed -i "a slaveof ${REDIS_PORT_6379_TCP_ADDR} ${REDIS_PORT_6379_TCP_PORT}"  ${REDIS_CONFIG}
	else
		echo "=> It was slaveof already"
		echo "=> Info :${ifslaveof}"
	fi
fi
echo "=>Start redis"
${REDIS_SERVER} ${REDIS_CONFIG}
