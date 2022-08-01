#!/bin/bash

P_DIR="/publico"
D_GRP_ADM="/adm"
D_GRP_VEN="/ven"
D_GRP_SEC="/sec"

GRPS="GRP_ADM GRP_VEN GRP_SEC"

U_GRP_ADM="carlos maria joao"
U_GRP_VEN="debora sebastiana roberto"
U_GRP_SEC="josefina amanda rogerio"


# Etapa 1: Remove os diretorios, usuarios e grupos pre-existentes
echo "Removendo diretórios ..."
for d in $P_DIR $D_GRP_ADM $D_GRP_VEN $D_GRP_SEC
do 
	rm -rf $d
done

echo "Excluindo usuários ..."
for u in $U_GRP_ADM $U_GRP_VEN $U_GRP_SEC
do
	echo " Excluindo $u"
	userdel -rf $u
done

echo "Excluindo grupos ..."
for g in $GRPS
do
	echo " Excluindo $g"
	groupdel $g
done

# Etapa 2: Cria os diretorios, grupos e usuarios
echo "Criando diretório $P_DIR"
mkdir $P_DIR
chmod 777 $P_DIR #Todos usuarios tem acesso total ao diretorio publico

for g in $GRPS
do
	echo "Criando grupo $g ..."
	groupadd $g
	d="D_$g"
	echo " Criando diretório ${!d}"
	mkdir ${!d}
	chown root:$g ${!d}
	chmod 770 ${!d}
	ug="U_$g"
	for u in ${!ug}
	do
		echo " Cadastrando usuário $u ..."
		useradd -m -s /bin/bash -G $g -p $(openssl passwd Senha123) $u
	done
done

# Fim do script
