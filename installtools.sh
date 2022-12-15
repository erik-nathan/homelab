#!/usr/bin/env bash
                                                                         
echo '  _____                 _             _   _     _______                   _        '
echo ' |_   _|               | |           | | | |   |__   __|                 | |       '
echo '   | |    _ __    ___  | |_    __ _  | | | |      | |      ___     ___   | |  ___  '
echo '   | |   |  _ \  / __| | __|  / _  | | | | |      | |     / _ \   / _ \  | | / __| '
echo '  _| |_  | | | | \__ \ | |_  | (_| | | | | |      | |    | (_) | | (_) | | | \__ \ '
echo ' |_____| |_| |_| |___/  \__|  \__ _| |_| |_|      |_|     \___/   \___/  |_| |___/ '
                                                                                          
# ----------------------------------------------------------------- #
# script para instalação de ferramentas para incialização de servidor
# ----------------------------------------------------------------- #                                                                                  
                                                                        
# ---------------- Removendo travas eventuais do apt -------------- #
echo '- REMOVENDO POSSÍVEIS ERROS DO APT...'
sudo rm /var/lib/dpkg/lock-frontend
sudo rm /var/cache/apt/archives/lock

# ---------------- Atualizando o Sistema -------------- #
echo '- ATUALIZANDO O SISTEMA...'
sudo apt update -y && sudo apt dist-upgrade -y ;

# ---------------- INSTALANDO ALGUMAS FERRAMENTAS -------------- #
echo '- INSTALANDO FERRAMENTAS...'

# --- GIT ---
echo '- Instalando Git...'
sudo apt-get install git-all
echo '--------------------------------------------'
# --- CURL ---
echo '- Instalando Curl...'
sudo apt install curl
echo '--------------------------------------------'
# --- OPENSSH ---
echo '- Instalando o OpenSSH...'
sudo apt install openssh-client openssh-server
echo '--------------------------------------------'

# ---------------- INSTALANDO DOCKER, COMPOSE E PORTAINER -------------- #

# --- DOCKER ---
echo '- INSTALANDO O DOCKER...'
echo 'Desinstalar possível versões antigas'
sudo apt-get remove docker docker-engine docker.io containerd runc
echo 'Intalando o Docker...'
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg &&
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null ;
# adicionando o usuario ao grupo do docker
sudo usermod -aG docker $USER ;
echo '--------------------------------------------'

# --- DOCKER COMPOSE ---
echo '- INSTALANDO O COMPOSE...'
sudo curl -L \
  "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" \ 
  -o /usr/local/bin/docker-compose \
&& sudo chmod +x /usr/local/bin/docker-compose ;
echo '--------------------------------------------'

# --- PORTAINER ---
echo '- INSTALANDO O PORTAINER...'
echo 'Criando o volume do portainer'
docker volume create portainer_data
echo 'Rodando o Portaienr'
docker run -d -p 8000:8000 -p 9000:9000 --name portainer \
--restart=always \
-v /var/run/docker.sock:/var/run/docker.sock \
-v portainer_data:/data \
portainer/portainer-ce:2.9.3
echo '--------------------------------------------'

# ---------------- INSTALANDO TELEGRAF -------------- #
echo '- INSTALANDO O TELEGRAF...'
curl -s https://repos.influxdata.com/influxdb.key | sudo tee /etc/apt/trusted.gpg.d/influxdb.asc >/dev/null
source /etc/os-release
echo "deb https://repos.influxdata.com/${ID} ${VERSION_CODENAME} stable" | sudo tee /etc/apt/sources.list.d/influxdb.list
sudo apt-get update && sudo apt-get install telegraf
echo '--------------------------------------------'

# --------------- Finalizando e limpando --------------- #
sudo apt update && sudo apt dist-upgrade -y ;
sudo apt autoclean ;
sudo apt autoremove -y

echo 'Author: erik nathan'
