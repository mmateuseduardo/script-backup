########################################################
###    Script utilizado para limpar o iptables      ####
###       Script used to clean up iptable           ####
###                                                 ####
###             by: Tequel / Terquel                ####
########################################################

#!/bin/bash

iptables -L
iptables -P INPUT ACCEPT
iptables -P FORWARD ACCEPT
iptables -P OUTPUT ACCEPT
iptables -t nat -F
iptables -t mangle -F
iptables -F
iptables -X
iptables -L
