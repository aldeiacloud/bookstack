<h2>Wiki Bookstack na AWS de uma forma rápida!</h2>

<b>RESUMO: <br>Configuração de uma aplicação Bookstack com Apache<br>
Contém certificado SSL LetsEncrypt com renovação automática e redirecionamento de HTTP para HTTPS.</b>

 <b>Extras:</b>
  - Altera o horário do Ubuntu para GMT-3;
  - Configura 2GB de Swap e adiciona no /etc/fstab.

<b>Vídeo da implementação: https://www.youtube.com/watch?v=Rs0RYxts9fc</b>

------------------------------------------------------------------------------

<b>1- </b>AO <b>FINAL DA PÁGINA</b> DE CONFIGURAÇÃO DA ZONA/VPC DA EC2, ADICIONAR AS LINHAS ABAIXO À CAIXA EM BRANCO:

#!/bin/bash<br>
cd /tmp<br>
sudo apt update<br>
# CERTIFICADOS SSL<br>
sudo apt install -y certbot<br>
sudo apt install -y python-certbot-apache<br>
# RENOVACAO AUTOMATICA SSL<br>
sudo echo "SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
0 */12 * * * root certbot -q renew --apache" >> /etc/cron.d/certbot<br>
# INSTALACAO DO BOOKSTACK<br>
sudo wget https://raw.githubusercontent.com/BookStackApp/devops/master/scripts/installation-ubuntu-18.04.sh<br>
sudo chmod a+x installation-ubuntu-18.04.sh<br>
sudo ./installation-ubuntu-18.04.sh<br>
# CRIAR SWAP<br>
sudo fallocate -l 2G /swapfile<br>
sudo chmod 600 /swapfile<br>
sudo mkswap /swapfile<br>
sudo swapon /swapfile<br>
sudo echo "/swapfile swap swap defaults 0 0" >> /etc/fstab<br>
# CONFIGURAR HORARIO (BUENOS AIRES = BRASILIA SEM HORARIO DE VERAO)<br>
sudo timedatectl set-timezone America/Argentina/Buenos_Aires<br>

------------------------------------------------------------------------------

<b>2-</b> ATACHAR ELASTIC IP NA INSTÂNCIA:

------------------------------------------------------------------------------

<b>3-</b> FAZER APONTAMENTO NA TABELA DE DNS PARA O IP DA INSTÂNCIA<br>

------------------------------------------------------------------------------

<b>4-</b> ADICIONAR ServerName PARA SEU APONTAMENTO<br>

------------------------------------------------------------------------------

<b>5-</b> ALTERAR URL E CONFIGURAR ENVIO DO BOOKSTACK NO .ENV</b><br>

------------------------------------------------------------------------------

<b>5-</b> CONFIGURAR CERTIFICADO</b><br>
sudo certbot --apache
