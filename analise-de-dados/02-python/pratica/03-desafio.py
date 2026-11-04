lista_nome = []
nome_busca = "descomplica"


def busca_nome(nome_lista: list, nome_busca: str):
    achou = False
    indice = 0

    lista_temp = list(nome_lista)

    if lista_temp:
        if lista_temp[indice].lower() == nome_busca.lower():
            achou = True
        else:
            lista_temp.remove(lista_temp[indice])
            achou = busca_nome(
                lista_temp, nome_busca
            )  # pega o retorno da proxima chamada

    return achou


for nome in range(5):
    # popular a lista
    lista_nome.append(input("Digite um nome: "))

# verificar se o nome_busca esta presente na lista
achou = busca_nome(lista_nome, nome_busca)

print("Achou: ", nome_busca.upper()) if achou else print("Não está em: ", lista_nome)
