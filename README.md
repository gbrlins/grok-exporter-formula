# Creating grok-exporter formula

*Documentation available at https://github.com/fstab/grok_exporter*

This example uses one host connected on SUSE Manager server runing Grafana and Prometheus. Beyond that, the formula is implemented to be used with SUSE Manager to be applied directly into the salt-minions through the web interface.

Aplicar passo-a-passo no server SUSE Manager: 

### Passo 1: Baixar grok_exporter
```
wget https://github.com/fstab/grok_exporter/releases/download/v1.0.0.RC3/grok_exporter-1.0.0.RC3.linux-amd64.zip
```
Após download, explodir o .zip e entrar no diretório que foi explodido:
```
unzip grok_exporter-1.0.0.RC3.linux-amd64.zip
cd grok_exporter-1.0.0.RC3.linux-amd64/
``` 
### Passo 2: Configurar arquivo config.yml
O arquivo encontra-se por padrão dentro da pasta "example". Entrar no diretório example e substituir o arquivo config-file.yml pelo conteúdo do arquivo <a href="https://github.com/gbrlins/grok-exporter/blob/master/config-file.yml">config.yml</a>

*obs: A identação é importante para o funcionamento. Verifique!*

### Passo 3: Criar .tar do Grok e mover para o diretório específico
```
tar cfv grok_exporter-1.0.0.tar grok_exporter-1.0.0.RC3.linux-amd64/
mkdir /srv/salt/grok-exporter
cd /srv/salt/grok-exporter
```
### Passo 4: Criar salt formula com o arquivo init.sls
```vim init.sls``` com o conteúdo de <a href="https://github.com/gbCrrlins/grok-exporter-formula/blob/master/init.sls">init.sls</a>

### Passo 5: Dentro do diretório atual, mover .tar
```mkdir files``` e ```mv {grok-exporter}.tar``` para esse novo diretório

### Passo 6: Configurar metada
```cd /srv/formula_metada```
```mkdir grok-exporter```

Criar esses <a href="https://github.com/gbrlins/grok-exporter/blob/master/config-file.yml">arquivos</a> dentro dessa pasta

### Passo 7: Restartar o SUSE Manager
```spacewalk-service restart```

### Passo 8: Configurar o arquivo prometheus.yml do host rodando Prometheus
```vim /etc/prometheus/prometheus.yml```
