# Hadoop - Praticas

## HDFS
Pratica manipulação arquivos:  
1. Criar pasta text no HDFS  
1. Copiar dados /usr/share/mime/text xml para text  
1. Copiar dados /usr/share/mime/message xml para text  
1. Listar arquivos da pasta text  
1. Apagar pasta text do HDFS arquivos iniciados com x-  
1. Listar arquivos da pasta text  

```bash
hdfs dfs -mkdir /text
hdfs dfs -ls /
```
```bash
cd /usr/share/mime/text
hdfs dfs -put *.xml /text
```
```bash
cd /usr/share/mime/message
hdfs dfs -put *.xml /text
```
```bash
cd /usr/share/mime/message
hdfs dfs -put *.xml /text
```
```bash
hdfs dfs -ls /text
```
```bash
hdfs dfs -rm /text/x-*.xml
hdfs dfs -ls /text
```

--- 
Baixar arquivos para máquina local no diretório atual.
```bash
hadoop fs -get /tmp/hdfs-site.xml
hdfs dfs -get /tmp/hdfs-site.xml
```
---
Exercício:
1. Criar a pasta Log no HDFS  
1. Mover o arquivo output1.log para pasta /log do HDFS  
1. Mover o arquivo output2.log para pasta /log do HDFS  
1. Apagar o arquivo  do HDFS da pasta /tmp  

```bash
hdfs dfs -mkdir /log
hdfs dfs -put output1.log /log
hdfs dfs -put output2.log /log
hdfs dfs -rm /tmp/teste.log
```
----
# Serviços de empresas
[Microsoft HDInsight](https://learn.microsoft.com/pt-br/azure/hdinsight/hadoop/apache-hadoop-introduction)  
[Cloudera Manager](https://docs.cloudera.com/cdsw/1.10.5/architecture-overview/topics/cdsw-cloudera-manager.html)  
[Huawei MapReduceService](https://www.huaweicloud.com/intl/pt-br/product/mrs.html)    
[Apache Hadoop on Amazon EMR](https://aws.amazon.com/emr/features/hadoop/?trk=9b2832f4-d1c9-49e9-9dff-84502910d093&sc_channel=ps&ef_id=CjwKCAjwgJHXBhBGEiwAHohJqwmyUn_QrXzvQ7gArNc2UeNUkUrG3AQHUrOd3iq0QDsLiiW25_hYqxoCxFEQAvD_BwE:G:s&gads_camp=23523527400&gads_ag=191423953614&gads_ad=828840024440&gads_kw=hadoop&gads_matchtype=p&gads_network=g&gads_device=c&gads_geo=9198389&gad_campaignid=23523527400&gbraid=0AAAAADjHtp_slC4bIZz-1eGg_ngS8m-qC&gclid=CjwKCAjwgJHXBhBGEiwAHohJqwmyUn_QrXzvQ7gArNc2UeNUkUrG3AQHUrOd3iq0QDsLiiW25_hYqxoCxFEQAvD_BwE)

--
# Map Reduce (Agregador - Group by)

Processamento Paralelo nos DataNodes.  
Multilinguagem: Java, Python, R e Ruby.     

## Fase
1. Mapeamente = Chave, valor  
2. Redução = Agrupamento (Sum, Avg, Max, Min)  
 
## Exemplo
Python com biblioteca MRJOB  

Arquivo **analisa.py**.  
```python
from mrjob.job import MRJob

class MRAvaliaFilme(MRJob):

    def mapper(self, key, line):
        # Mapeamento
        (userId, movieId, rating, timestamp) = line.split('\t')
        # Enviando para redução o usuarioId
        yield userId, 1 # chave. valor

    def reducer(self, userId, occurences):
        # Realiza o Shuffle
        # Contabiliza quantos vezes usuário votou (avaliou)
        yield userId, sum(occurences) # Sum - Group By UserId

if __name__ == '__main__':
    # Executa o MRJob
    MRAvaliaFilme.run()
```
Executar no hadoop:  
```bash
python analisa.py hdfs:///mapred/arquivodados.data -r hadoop
```

Exercício Média dos Votos do Usuário:
```python
from mrjob.job import MRJob

class MRAvaliaFilme(MRJob):

    def mapper(self, key, line):
        # Mapeamento
        (userId, movieId, rating, timestamp) = line.split('\t')
        # Enviando para redução o usuarioId
        yield userId, rating # chave. valor

    def reducer(self, userId, occurences):
        # Realiza o Shuffle
        # Contabiliza quantos vezes usuário votou (avaliou)
        yield userId, avg(occurences) # Avg - Group By UserId

if __name__ == '__main__':
    # Executa o MRJob
    MRAvaliaFilme.run()
```
