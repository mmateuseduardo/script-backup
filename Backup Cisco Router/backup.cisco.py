# Script de backup de um roteador cisco
# importa as libs netmiko e getpass
import netmiko, getpass

# pergunta IP usuario e senha de acesso do roteador
ip = input('Device IP: ')
un = input('Username: ')
pw = getpass.getpass()
sc = getpass.getpass(prompt='Secret: ')

# cria variavel cisco_ios com as informacoes de acesso
cisco_ios = {
'device_type': 'cisco_ios',
'ip': ip,
'username': un,
'password': pw,
'secret': sc,
}

# conecta ao roteador usando o ConnectHandler do netmiko
net_connect = netmiko.ConnectHandler(**cisco_ios)

# espera o prompt de comando ficar disponivel
prompt = net_connect.find_prompt()

# cria o arquivo backup.txt para salvar as configs
filename = "backup.txt"

# executa o comando enable no terminal do roteador
net_connect.enable()

# executa o comando show run no roteador
showrun = net_connect.send_command('show run')

# executa o comando show ver no roteador
showver = net_connect.send_command('show ver')

# abre o arquivo backup.txt e armazena o backup
log_file = open(filename, "a")
log_file.write(showrun)
log_file.write("\n")
log_file.write(showver)
log_file.write("\n")

# sai do enable do roteador
net_connect.exit_enable_mode()

# desconecta do roteador
net_connect.disconnect()