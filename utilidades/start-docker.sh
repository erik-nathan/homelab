#!/usr/bin/env bash
                                                                         
echo '  ____    _                    _       ____                   _                  '
echo ' / ___|  | |_    __ _   _ __  | |_    |  _ \    ___     ___  | | __   ___   _ __ '
echo ' \___ \  | __|  / _  | |  __| | __|   | | | |  / _ \   / __| | |/ /  / _ \ |  __|'
echo '  ___) | | |_  | (_| | | |    | |_    | |_| | | (_) | | (__  |   <  |  __/ | |   '
echo ' |____/   \__|  \__ _| |_|     \__|   |____/   \___/   \___| |_|\_\  \___| |_|   '
                                                                                          
# --------------------------------------- #
# script para instalar o docker composes
# --------------------------------------- #  

# ---------------- INSTALANDO OS COMPOSES -------------- #
echo 'example'
docker-compose -f <diretório>/docker-compose.yaml up -d --force-recreate
