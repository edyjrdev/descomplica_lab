# Professor
 **Juracy Araujo de Almeida Junior**  
[Linkedin](https://www.linkedin.com/in/juracyaraujo)  
[Udemy](https://www.udemy.com/user/juracy-araujo-de-almeida-junior/?srsltid=AYCX9vKl958DmhucH920ABQtMInn6bOWNkY4VjDHzKFRGuz2EkdMDU5w)  
[Youtube](https://www.youtube.com/channel/UC9x53qtj4ExOtBavStxf2NA)  
[Site](http://www.juracyalmeida.com/)   
---
## Tópicos
1. Apresentação  
1. Hadoop Framework  
1. HDFS  
1. MapReduce  
1. YARN  
1. SPARK  
1. KAFKA  
1. MPP  
1. Conteinerização  
---
[HDFS Commands Guide](https://hadoop.apache.org/docs/r3.5.0/hadoop-project-dist/hadoop-hdfs/HDFSCommands.html)  

---
# YARN 
Gestão de Recursos: Fila, Nós, Memória.  
Configuração de componentes.    

Processos
1. ResourceManager (Scheduler, ApplicationManager) 
1. NodeManager (Container, ApplicationMaster)  

Configuração.  
```bash
cat /opt/hadoop/ect/hadoop/yarn-site.xml
```

Consulta todas aplicações em todos os estados.  
```bash
yarn application -list -appStates all
```

Consulta aplicação  
```bash
yarn application -status <application_ID>
```

Consulta aplicações em um estado.  
```bash
yarn application -list -appStates <NEW/RUNNING/FINISHED>
```
Consulta Estado de uma aplicação.  
```bash
yarn application -status
```

# KAFKA
[Kafka](https://kafka.apache.org/)  
--
# MPP
Cluster  
Grid  
Cloud  
1. SaaS  
1. PaaS  
1. IaaS  

MPP vs. SMP  

SMP - Multiprocessamento Simétrico com recursos compartilhados.  

Azure Synapse Analytics (MPP)  

---
# Conteinerização  
Docker  
[DockerHub](https://hub.docker.com)  
Docker Compose  
Kubernetes   
Minikube   
--- 