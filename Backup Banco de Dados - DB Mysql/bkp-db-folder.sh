#!/bin/bash


#================================== DADOS DO BANCO DE DADOS ===============================
# USUARIO DO BANCO DE DADOS
mysqluser=root

# SENHA DO BANCO DE DADOS
mysqlpass=senhasql

# BANCO DE DADOS QUE SERA FEITO O BACKUP
mysqldb=glpi
#==========================================================================================


# DIRETORIO QUE SERA FEITO O BACKUP
sdir=/var/www/html

# DIRETORIO ONDE SERAO ARMAZENADOS OS BACKUPs TEMPORARIAMENTE NO DISCO
tempdir=/bkp/

# TIMESTAMP COM ANO-MES-DIA
timestamp=$(date +"%Y-%m-%d")


# VERIFICA SE O DIRETORIO DE BACKUP FOI CRIADO
if [ ! -d "$tempdir$timestamp" ]; then
        echo "criando diretorio $DIRETORIO"
        `mkdir -p $tempdir$timestamp`
fi

# GERA BACKUP DO BANCO NO DISCO LOCAL
mysqldump -u $mysqluser -p$mysqlpass $mysqldb > $tempdir$timestamp/$mysqldb.sql

# COPIA OS ARQUIVOS DO /VAR/WWW/HTML PARA A PASTA BACKUP
tar -zcf $tempdir$timestamp/glpi.tgz /var/www/html/*
# COPIA CERTIFICADOS PARA PASTA BACKUP
tar -zcf $tempdir$timestamp/cert.tgz /etc/letsencrypt/live/chamados.dominio.com.br/*
# FAZ BKP DO SCRIPT DE BACKUP
cp /home/suporte/bkp-script.sh $tempdir$timestamp/

# APAGA BACKUP COM MAIS DE 30 DIAS
find /bkp/* -mtime +30 -exec rm {} \;

# COPIA O BACKUP PARA O SERVIDOR
find /mnt/suporte/bkp-glpi/* -mtime +30 -exec rm {} \;
cp -r $tempdir$timestamp /mnt/suporte/bkp-glpi
