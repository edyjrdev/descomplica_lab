import datetime as dt

0
nome = input("Digite seu nome: ")
ano_nascimento = input("Digite seu ano de nascimento: ")

idade = dt.datetime.now().year - int(ano_nascimento)

print(f"Olá {nome.upper()}", ".\n", f"{nome.upper()} está com {idade} anos.")
