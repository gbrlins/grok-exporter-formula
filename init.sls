/etc/grok-exporter:
{% if salt['pillar.get']('grok_exporter:enabled', True) %}
  archive.extracted:
    - source: salt://grok-exporter/files/grok_exporter-1.0.0.tar
    - user: root
    - group: root
    - mode: 644
cron-usb:
  cron.present:
    - name: usb-devices | grep Product= > /etc/grok-exporter/grok_exporter-1.0.0.RC3.linux-amd64/example/usb_activity.log
    - identifier: Rotina de Log para registrar dispositivos conectados
    - user: root
cron-grok:
  cron.present:
    - name: nohup /etc/grok-exporter/grok_exporter-1.0.0.RC3.linux-amd64/grok_exporter -config /etc/grok-exporter/grok_exporter-1.0.0.RC3.linux-amd64/example/config.yml &> /dev/null &
    - identifier: Rodar o grok exporter sempre que a máquina reiniciar
    - user: root
    - special: '@reboot'
  cmd.run:
    - name: nohup ./grok_exporter -config ./example/config.yml &> /dev/null &
    - cwd: /etc/grok-exporter/grok_exporter-1.0.0.RC3.linux-amd64/
    - bgFalse: True
{% else %}
{% endif %}
