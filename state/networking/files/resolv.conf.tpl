# THIS FILE IS CONTROLLEB BY SALTSTACK!
#
{% if grains['id'].startswith('gw') or grains['id'] == 'srv1' -%}
# Gateways running bind prefer themselves as primary dns server,
# the dns master as secondary, and opendns as a fallback.

nameserver 127.0.0.1
nameserver {{ pillar['bind']['master']['ipv4'] }}
{%- else %}
# Use two gateway servers as primary and secondary dns, and
# opendns as a fallback.

nameserver 10.185.0.4
nameserver 10.185.0.15
{%- endif %}
nameserver 84.200.83.161
