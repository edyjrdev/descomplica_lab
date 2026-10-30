# Professor
**Marcio Santos**  
[Youtube](https://www.youtube.com/@codigoceo)  
[Instagram](https://www.instagram.com/CodigoCEO)  


## Python version
**3.10.7**  

## IDE
Visual Studio Code  
### Extensão
Python Microsoft

## GIT
[Git](https://github.com/FaculdadeDescomplica/Python)

## Instalação Ambiente com Poetry e Pyenv

Cria ambiente Base  
```bash
pyenv versions
pyenv install 3.10.7
```
Indica projeto para usar VirtualEnv local.
```bash
pyenv local 3.10.7
```

```bash
poetry init
```

```bash
poetry config virtualenvs.in-project true
poetry config --list
poetry env info
```

Se tiver criado o Virtualenv no cache. 
```bash
poetry env remove python
```
Obs. É necessário apagar completamente a pasta do cache para que o poetry crie o virtual env no projeto.
Ultimo caso apagar pelo windows explorer ou linha de comando.  
```powershel
Remove-Item -Recurse -Force "C:\Users\S836491661\AppData\Local\pypoetry\Cache\virtualenvs\pratica-2jN_ZYR3-py3.10"
```

Criar o .venv no projeto:  
```bash
poetry env use 3.10.7
```

Atualizar dependências:
```bash
poetry add <library>
```

Atualizar dependências:
```bash
poetry check
poetry install
poetry lock
```

---
## Tópicos
1. Apresentação  
1. Primeiros passos  
1. Manipulação de dados  
1. Condicionais  
1. Laços de repetição  
1. Funções  
1. Avançando na programação  
1. Programação Orientada a Objetos (POO): Conceitos avançados  
1. Manipulação de arquivos e tratamento de erros  