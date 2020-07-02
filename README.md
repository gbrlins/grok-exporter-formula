# Criando um salt-formula no SUMA: grok-exporter

*Documentação disponível em https://github.com/fstab/grok_exporter*

Esse exemplo utiliza um host conectado no SUSE Manager. A instalação do Prometheus e do Grafana foram feito através do salt, no SUMA. A formula é implementada para ser utilizada com o SUSE Manager para ser aplciado diretamente nos salt-minions através da interface web.

Aplicar passo-a-passo no server SUSE Manager: 

# Passo a passo
1. **Baixar grok_exporter**: Após download, explodir o .zip e entrar no diretório que foi explodido
```
wget https://github.com/fstab/grok_exporter/releases/download/v1.0.0.RC3/grok_exporter-1.0.0.RC3.linux-amd64.zip
unzip grok_exporter-1.0.0.RC3.linux-amd64.zip
cd grok_exporter-1.0.0.RC3.linux-amd64/
``` 

2. **Configurar arquivo config.yml**: O arquivo encontra-se por padrão dentro da pasta "example". Entrar no diretório example e substituir o arquivo _config.yml_ pelo conteúdo do arquivo <a href="https://github.com/gbrlins/grok-exporter-formula/blob/master/config.yml">config.yml</a>
*obs: A identação é importante para o funcionamento. Verifique!*

3. **Criar .tar do Grok e mover para o diretório específico:** Voltar para fora do diretório grok-exporter e aplicar o comando:
```
tar cfv grok_exporter-1.0.0.tar grok_exporter-1.0.0.RC3.linux-amd64/
mkdir /srv/salt/grok-exporter
cd /srv/salt/grok-exporter
```

4. **Criar salt formula com o arquivo init.sls**: 
```vim init.sls``` com o conteúdo de <a href="https://github.com/gbrlins/grok-exporter-formula/blob/master/init.sls">init.sls</a>

5. **Dentro do diretório atual, mover o .tar criado**:
```mkdir files``` e ```mv {grok-exporter}.tar``` para esse novo diretório

6. **Configurar metadata**: 
```
cd /srv/formula_metadata
mkdir grok-exporter
```
Criar esses <a href="https://github.com/gbrlins/grok-exporter-formula/tree/master/arquivos">arquivos</a> dentro dessa pasta

7. **Restartar o SUSE Manager**: ```spacewalk-service restart```

8. **Configurar o arquivo prometheus.yml do host rodando Prometheus**:
```
vim /etc/prometheus/prometheus.yml
systemctl restart prometheus.service
```
