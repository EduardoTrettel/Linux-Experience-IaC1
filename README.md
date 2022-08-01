# Infraestrutura como Código - Desafio 1

## Script cria-usuario-iac1.sh

Script em bash(1) que inicializa uma estrutura de usuários, grupos e diretórios da seguinte forma
- Cria um diretório público /publico
- Cria diretórios para os diversos grupos: GRP\_ADM (/adm), GRP\_VEN (/ven) e GRP\_SEC (/sec)
- Cria estes grupos e atribui permissão de acesso total ao grupo para o diretório respectivo.
- Cadastra os usuários de cada grupo.

Na inicialização o script remove toda a estrutura anterior.

