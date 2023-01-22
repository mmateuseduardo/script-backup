#!/usr/bin/env bash
#
# ============================================================================ #
# CONFIG IPTABLES.                                                             #
# config.security.sh                                                           #
# Autor: mmateuseduardo                                                        #
# URL: https://github.com/mmateuseduardo                                       #
# ============================================================================ #
# CREDITOS                                                                     #
# Colaborador: danielcshn remontti                                             #
# URL: https://github.com/danielcshn URL:https://github.com/remontti           #
# ============================================================================ #
# Todo projeto foi desenvolvido por mim, mas algumas ideias e scripts          #
# que estão no meio do código pertence a outras pesssoas, sendo assim não      #
# seria certo deixar de comentar o nome delas e dar os creditos,               #
# Muito Obrigado e espero futuramente fazer melhorias                          #
# ============================================================================ #
# Copyright (c) 2023 mmateuseduardo                                            #
# ============================================================================ #
# Este script vem com ABSOLUTAMENTE NENHUMA GARANTIA!                          #
# This Script comes with ABSOLUTELY NO WARRANTY!                               #
#
# High Intensty Colors Used:                                                   #
# https://gist.github.com/JBlond/2fea43a3049b38287e5e9cefc87b2124#file-bash-colors-md #
# =============================================================================#

Black="\e[0;90m"
Red="\e[1;31m" # Bold
Green="\e[0;92m"
Yellow="\e[0;93m"
Blue="\e[0;94m"
Purple="\e[0;95m"
Cyan="\e[0;96m"
White="\e[0;97m"

  printf "${Yellow}Script Shell p/ Backups de Arquivos Diretorios e Banco de Dados LINUX c/ Envio p/ o TELEGRAM!!!\n"
  printf "${Green}\n Developed by: mmateuseduardo ( https://github.com/mmateuseduardo )"
  printf "${Green}\n Version: 1.0\n"

##### MENU < TESTED OK
menu () {
        printf "\n${Yellow} [ Selecione uma Opção para Continuar ]\n\n"
        printf " ${Red}[${Blue}1${Red}] ${Green}Instalar Dependencias - Curl - Wget\n"
        printf " ${Red}[${Blue}2${Red}] ${Green}Informar os Dados do Telegram\n"
        printf " ${Red}[${Blue}3${Red}] ${Green}Backup De Diretório\n"
        printf " ${Red}[${Blue}4${Red}] ${Green}Backup Banco de Dados\n"
        printf " ${Red}[${Blue}5${Red}] ${Green}Exit\n\n"
        printf "${Green}┌─[${Red}Selecione uma Opção${Green}]──[${Red}~${Green}]─[${Yellow}Menu${Green}]:\n"
        read -p "└──►$(tput setaf 7) " option
        case $option in
        1) Depedencia ;;
        2) Telegram ;;
        3) Diretorio ;;
        4) DB ;;
        5) Exit ;;
        *)printf "${White}[${Red}Error${White}] Selecione uma opção Correta...\n\n" ; menu ;;
esac
}
##### Instalação de Depedencia < TESTED OK
        Depedencia(){
        printf "\n[${Green}Selected${White}] Opção 1 - Verificação de Dependencias...\n\n"
        printf "${Red}\nInstalando Pacotes ${White}:)\n\n"
        apt install curl wget zip -y
        printf "${Red}\nPacotes Instalados ${White}:)\n\n"
        menu
        }
##### Telegram < TESTED OK
Telegram(){
        printf "[${Green}Selected${White}] Opção 2 - Informação os Dados do Telegram...\n\n"
        printf "\n${White}Informe o ID do Usuário/Grupo o TOKEN do BOOT e a Forma de Compactação TAR/ZIP\n"
        printf "${White}User/Grupo ID: "
        read ID
        printf "${White}TOKEN BOOT: "
        read TOKEN
        printf "${White}Forma de Compactação: "
        read COMPAC
        printf "${Red}\nMENSAGEM DE TESTE ENVIADO PARA O USUÁRIO/GRUPO ${White}:)\n"
        curl --silent -X POST \
        --data-urlencode "chat_id=$ID" \
        --data-urlencode "text=Enviando para USUÁRIO/GRUPO" \
        "https://api.telegram.org/bot$TOKEN/sendMessage"
        echo "\no\n"
        printf "${Red}\nEfetuado Download e Configurado o Script para Envio de Mensagens ao Telegram ${White}:)\n"
        wget https://raw.githubusercontent.com/remontti/telegramBotShell/master/telegram -O /bin/telegram
        chmod +x /bin/telegram  /bin/telegram
        sed -i "s/000000000:0000000000000-0000000000000000000000000000000/$TOKEN/" /bin/telegram
        sed -i "s/tar/$COMPAC/" /bin/telegram
        #   sed -i "s/22/$PORTA/"
        printf "${Red}Arquivo salvo em /bin/telegram ${White}:)\n"
        menu
}
##### BACKUP DIRETORIO1 < TESTED OK
Diretorio(){
        printf "\n[${Green}Selected${White}] Opção 3 - Backup De Diretório...\n\n"
        printf "\n${Yellow} [ Selecione uma opção para continuar ]\n\n"
        printf " ${Red}[${Blue}1${Red}] ${Green}Backup de Diretórios\n"
        printf " ${Red}[${Blue}2${Red}] ${Green}Backup DNS Server\n"
        printf " ${Red}[${Blue}3${Red}] ${Green}Backup WebSite\n"
        printf " ${Red}[${Blue}4${Red}] ${Green}Backup FastNetmon\n"
        printf " ${Red}[${Blue}5${Red}] ${Green}Backup SpeedTest/Minha Conexão\n"
        printf " ${Red}[${Blue}6${Red}] ${Green}Voltar ao Menu Principal\n"
        printf " ${Red}[${Blue}7${Red}] ${Green}Exit\n\n"
        printf "${Green}┌─[${Red}Selecione uma Opção${Green}]──[${Red}~${Green}]─[${Yellow}Menu${Green}]:\n"
        read -p "└──►$(tput setaf 7) " opcao_var
        case $opcao_var in
        1) 1D ;;
        2) DNS ;;
        3) WebSite ;;
        4) FastNetMon ;;
        4) SpeedTest ;;
        5) Menu ;;
        7) Exit ;;
        *)printf "${White}[${Red}Error${White}] Selecione uma opção Correta...\n\n" ; Diretorio ;;
esac
}
        1D(){
        printf "\n[${Green}Selected${White}] Option 1 Backup De Diretório...\n"
        printf "${White}Informe o Diretorio para Backup, insira o Caminho Completo Ex: /var/log/*"
        printf "\n${Red}Criado Diretório /backup/D/ e o Script ${Green}para armazenar as informações\n\n"
        mkdir -p /backup/d/
        touch /backup/d/d.telegram.sh
        chmod a+x  /backup/d/d.telegram.sh
        ls -lah /backup/*
        printf "\n${Blue}Informe a quantidade de  Diretório: "
        read dir
        x=1
        while [ $x -le $dir ]
        do
        printf "${White}Insira o Diretorio $x: "
        read idir
        printf "${White}Informe um nome para o Arquivo de Backup: "
        read nome
        printf "${White}Informe um nome para Identificação "Comentário": "
        read comentario
        printf "\n${Red}==================================================================================\n"
        echo "/bin/telegram -f \""$ID"\" \""$idir"\" \""$nome"\" \""$comentario"\"" >> /backup/d/d.telegram.sh
        x=$(( $x + 1 ))
done
        #printf "\n${White}POR PADRÃO ESSE ESCRIPT RODA UMA VEZ POR SEMANA, DESEJA EFETUAR ALTERAÇÃO ???"
        #printf "\n${RED}ESSA ALTERAÇÃO PODE SER EFETUADA NO ARQUIVO /var/spool/cron/crontabs/root..."
        grep -q /backup/d/d.telegram.sh /var/spool/cron/crontabs/root || echo "10 10 * 1 * /backup/d/d.telegram.sh " >> /var/spool/cron/crontabs/root
        cat /backup/d/d.telegram.sh
        printf "\n${Blue}PARA TESTE FOI ENVIADO UM BACKUP AO SEU TELEGRAM, POR FAVOR VERIFIQUE\n"
        /backup/d/d.telegram.sh
        menu
}
        WebSite(){
        printf "\n[${Green}Selected${White}] Option 3 Backup WebSite...\n"
        printf "\n${Red}Criado Diretório /backup/web/ e o Script ${Green}para armazenar as informações\n\n"
        mkdir -p /backup/web/
        touch /backup/web/w.telegram.sh
        chmod a+x  /backup/web/w.telegram.sh
        ls -lah /backup/*
        printf "\n${Red}==================================================================================\n"
        echo "/bin/telegram -f \""$ID"\" \"/var/www/*\" \"web\" \"PASTA COMPLETA DO APACHE\"" >> /backup/web/w.telegram.sh
        #printf "\n${White}POR PADRÃO ESSE ESCRIPT RODA UMA VEZ POR SEMANA, DESEJA EFETUAR ALTERAÇÃO ???"
        #printf "\n${RED}ESSA ALTERAÇÃO PODE SER EFETUADA NO ARQUIVO /var/spool/cron/crontabs/root..."
        grep -q /backup/w/w.telegram.sh /var/spool/cron/crontabs/root || echo "10 10 * 1 * /backup/w/w.telegram.sh " >>  /var/spool/cron/crontabs/root
        cat /backup/web/w.telegram.sh
        printf "\n${Blue}PARA TESTE FOI ENVIADO UM BACKUP AO SEU TELEGRAM, POR FAVOR VERIFIQUE\n"
        /backup/web/w.telegram.sh
        menu
}


##### Exit < TESTED OK
        Exit (){
        printf "${Red}\nObrigado por usar o Scirpt ${White}:)\n\n"
        exit 0
}

menu
