#!/bin/sh

dockerize \
  -template /templates/settings.yml:/etc/foreman-proxy/settings.yml \
  -template /templates/bmc.yml:/etc/foreman-proxy/settings.d/bmc.yml \
  -template /templates/realm.yml:/etc/foreman-proxy/settings.d/realm.yml \
  -template /templates/dhcp.yml:/etc/foreman-proxy/settings.d/dhcp.yml \
  -template /templates/dhcp_isc.yml:/etc/foreman-proxy/settings.d/dhcp_isc.yml \
  -template /templates/dns.yml:/etc/foreman-proxy/settings.d/dns.yml \
  -template /templates/dns_nsupdate.yml:/etc/foreman-proxy/settings.d/dns_nsupdate.yml \
  -template /templates/tftp.yml:/etc/foreman-proxy/settings.d/tftp.yml \
  -template /templates/logs.yml:/etc/foreman-proxy/settings.d/logs.yml

if [ -z "$@" ]; then
  exec ruby /usr/share/foreman-proxy/bin/smart-proxy
fi

exec "$@"
