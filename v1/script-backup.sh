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

menu () {
	printf "\n${Yellow} [ Selecione uma opção para continuar ]\n\n"
  printf " ${Red}[${Blue}1${Red}] ${Green}Instalar Dependencias - Curl - Wget\n"
  printf " ${Red}[${Blue}2${Red}] ${Green}Informação os Dados do Telegram\n"
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
  *) "Opcao desconhecida." ; echo ; Backup ;;

    3) printf "\n[${Green}Selected${White}] Opção 3 - Backup De Diretório...\n\n"
       apt install curl wget -y       
       menu
       ;;
esac
}
Depedencia(){
       printf "\n[${Green}Selected${White}] Opção 1 - Verifica Dependencias...\n\n"
       apt install curl wget -y       
       menu
       ;;
esac
}
Telegram(){
       printf "\n[${Green}Selected${White}] Opção 2 - Informação os Dados do Telegram...\n\n"
       printf "${White}Informe o ID do Usuário/Grupo o TOKEN do BOOT e a Forma de Compactação TAR/ZIP "
       printf "${White}User/Grupo ID: "
       read ID     
       printf "${White}TOKEN BOOT: "
       read TOKEN
       printf "${White}Forma de Compactação: "
       read COMPAC
       menu
       ;;
esac
}
Diretorio(){
       printf "\n[${Green}Selected${White}] Opção 3 - Backup De Diretório...\n\n"
	     printf "\n${Yellow} [ Selecione uma opção para continuar ]\n\n"
       printf " ${Red}[${Blue}1${Red}] ${Green}Backup de Um Diretório\n"
       printf " ${Red}[${Blue}2${Red}] ${Green}Backup de Multiplos Diretório\n"
       printf " ${Red}[${Blue}3${Red}] ${Green}Backup DNS Server\n"
       printf " ${Red}[${Blue}4${Red}] ${Green}Backup FastNetmon\n"
       printf " ${Red}[${Blue}5${Red}] ${Green}Backup SpeedTest/Minha Conexão\n"
       printf " ${Red}[${Blue}6${Red}] ${Green}Voltar ao Menu Principal\n\n"
       printf " ${Red}[${Blue}7${Red}] ${Green}Exit\n\n"
       read opcao_var
	     case $opcao_var in
	     1) 1D ;;
	     2) 2D ;;
	     3) DNS ;;
	     4) FastNetMon ;;
	     5) SpeedTest ;;
       6) Menu ;;
       7) Exit ;;
	     *) "Opcao desconhecida." ; echo ; Seta_Var ;;
esac
}
		1D(){
       printf "\n[${Green}Selected${White}] Option 1 Backup De UM Diretório...\n"
       printf "${White}Informe o Diretorio para Backup, Informe o Caminho Completo Ex: /var/log/*"
       printf "${White}Informe o Diretório: "
       read Diretorio
       printf "${White}Informe um nome para o Arquivo de Backup: "
       read nomeD1
       printf "${White}Informe um nome para Identificação "Comentário": "
       read comentario
       printf "${Red}Criado Diretório /backup/1D/ e Script ${Green}para armazenar as informações\n\n"
       mkdir /backup/1D/
       touch /backup/1D/1D.telegram.sh
       chmod a+x  /backup/1D/1D.telegram.sh
       ls -lah /backup/*
       echo -e "#!/bin/bash\n/bin/telegram -f "$ID" "$Diretorio" "$nomeD1" "$comentario"
       printf "${Red}Realizado um Backup de Teste, Verifique seu ${Blue}Telegram\n\n"
       /bin/bash /backup/1D/1D.telegram.sh
       menu
				}
     2D(){
       printf "\n[${Green}Selected${White}] Option 2 Backup De Multiplos Diretório...\n"
       printf "${White}Informe o Diretorio para Backup, Informe o Caminho Completo Ex: /var/log/*"
       printf "${White}Informe o Diretório 1: "
       read diretorio1
       printf "${White}Informe um nome para o Arquivo de Backup: "
       read nome1
       printf "${White}Informe um nome para Identificação "Comentário": "
       read comentario1
       printf "${White}Informe o Diretório 2: "
       read diretorio2
       printf "${Red}Criado Diretório /backup/2D/ e Script ${Green}para armazenar as informações\n\n"
       mkdir /backup/2D/
       touch /backup/2D/2D.telegram.sh
       chmod a+x  /backup/2D/2D.telegram.sh
       ls -lah /backup/*
       echo -e "#!/bin/bash\n/bin/telegram -f "$ID" "$diretorio1 $diretorio2" "nome1" "comentario1"
       printf "${Red}Realizado um Backup de Teste, Verifique seu ${Blue}Telegram\n\n"
       /bin/bash /backup/1D/1D.telegram.sh
       menu
				}
		diretorio_captura(){
		echo -n "Entre com o diretorio para salvar a coleta de pacotes "
		read dirpacotes
		if [ ! -d "$dirpacotes" ]; then 
		    echo "Diretorio nao existe, criando diretorio..."
		    echo "."
		    echo ".."
		    echo "..."
		    mkdir $dirpacotes
		    Seta_var
		fi		## faltou fechar o if = (((dica: use a identação nos blocos )))
		}		## Faltou fechar a chave da função  Diretorio captura
		wordlist(){
		echo -n "Entre com o caminho absoluto da Wordlist, ex /home/wordlist.txt "
		read wordlist
		if [ ! -e "$wordlist" ]; then
		    echo "Wordlist nao existe ou foi digitada incorretamente"
		    Seta_var	
		fi		## faltou fechar o if = (((dica: use a identação nos blocos )))
		}
		parametros(){
		echo "interface Wifi: $interface"
		echo "Diretorio Captura: $dirpacotes"
		echo "Worlist: $wordlist"
		Seta_var		
		}
		Menu() {
		menu	
				}
		Snnifer(){
		airmon-ng start $interface
		echo -n "Entre com o nome da interface de monitoramento, ex wlan0mon "
		read mon_interface
		airodump-ng $mon_interface
		echo "Analise a rede wifi a ser quebrada e entre com os dados exatamente como aparecem"
		echo "Digite o BSSID da rede desejada:"
		read bssid
		echo "Digite o Canal, campo CH:"
		read canal
		echo "Digite o client, mac do  pc que esta na rede"
		read client
		echo "Executando Snnifer.."
		airodump-ng -c $canal --bssid $bssid -w $dirpacotes $mon_interface &
		Wifi
			}
		Inject(){
		aireplay-ng -0 2 $bssid -c $client $mon_interface
		sleep 10
		Wifi 
			}
		Crack(){
		aircrack-ng -a2 -b $bssid -w $wordlist $dirpacotes/*.cap
		sleep 10
		Wifi
			}
Wifi 
