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

