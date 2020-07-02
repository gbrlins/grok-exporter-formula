# Creating grok-exporter formula

*Documentation available at https://github.com/fstab/grok_exporter*

This example uses one host connected on SUSE Manager server runing Grafana and Prometheus. Beyond that, the formula is implemented to be used with SUSE Manager to be applied directly into the salt-minions through the web interface.

Aplicar passo-a-passo no server SUSE Manager: 

### Passo a passo

1. Baixar grok_exporter:
```
wget https://github.com/fstab/grok_exporter/releases/download/v1.0.0.RC3/grok_exporter-1.0.0.RC3.linux-amd64.zip
```
Após download, explodir o .zip e entrar no diretório que foi explodido:
```
unzip grok_exporter-1.0.0.RC3.linux-amd64.zip
cd grok_exporter-1.0.0.RC3.linux-amd64/
``` 

2. Configurar arquivo config.yml: O arquivo encontra-se por padrão dentro da pasta "example". Entrar no diretório example e substituir o arquivo config.yml pelo conteúdo do arquivo <a href="https://github.com/gbrlins/grok-exporter-formula/blob/master/config.yml">config.yml</a>

*obs: A identação é importante para o funcionamento. Verifique!*

3. Criar .tar do Grok e mover para o diretório específico:
```
tar cfv grok_exporter-1.0.0.tar grok_exporter-1.0.0.RC3.linux-amd64/
mkdir /srv/salt/grok-exporter
cd /srv/salt/grok-exporter
```

4. Criar salt formula com o arquivo init.sls: 
```vim init.sls``` com o conteúdo de <a href="https://github.com/gbrlins/grok-exporter-formula/blob/master/init.sls">init.sls</a>

5. Dentro do diretório atual, mover o .tar criado:
```mkdir files``` e ```mv {grok-exporter}.tar``` para esse novo diretório

6. Configurar metadata: 
```
cd /srv/formula_metadata
mkdir grok-exporter
```

Criar esses <a href="https://github.com/gbrlins/grok-exporter/blob/master/arquivos">arquivos</a> dentro dessa pasta

7. Restartar o SUSE Manager:
```
spacewalk-service restart
```

8. Configurar o arquivo prometheus.yml do host rodando Prometheus:
```
vim /etc/prometheus/prometheus.yml
systemctl restart prometheus.service
```
