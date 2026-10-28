# Requisito Funcional (RF) orientado a Dados 

## Padrão
RF01 - Manter `<Entidade>`
O sistema deve permitir inserir, alterar, deletar e consultar `<Entidade>s`.
Cada `<Entidade>` contém as informações: `<lista de atributos>`. O `<Entidade>` é identificado pelo `<atributo_identificador>`. As informações pessoais e sensiveis do `<Entidade>` são `<lista de atributos lgpd>`.
A exclusão de <Entidade> deve ser definitiva/ou lógica com registro em histórico.


## Exemplo
RF01 - Manter Empregado
O sistema deve permitir inserir, alterar, deletar e consultar empregados.
Cada empregado contém as informações: cpf, nome completo, data de nascimento, sexo, data de admissão, data de desligamento, endereço completo, cidade, estado. O empregado é identificado pelo cpf.
As informações pessoais e sensiveis do empregado são cpf, nome completo, data de nascimento, sexo, endereço completo.
A exclusão de empregado deve ser lógica com registro em histórico.