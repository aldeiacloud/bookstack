<h2>Wiki Bookstack na AWS de uma forma rápida!</h2>

<b>RESUMO: <br>Configuração de uma aplicação Bookstack com Apache.<br>
Contém certificado SSL LetsEncrypt com renovação automática e redirecionamento de HTTP para HTTPS.</b>

 <b>Extras:</b>
  - Altera o horário do Ubuntu para GMT-3;
  - Configura 2GB de Swap e adiciona no /etc/fstab.

<b>Vídeo da implementação: https://www.youtube.com/watch?v=Rs0RYxts9fc</b>

------------------------------------------------------------------------------

<b>1- </b>AO <b>FINAL DA PÁGINA</b> DE CONFIGURAÇÃO DA ZONA/VPC DA EC2, ADICIONAR AS LINHAS ABAIXO À CAIXA EM BRANCO:

#!/bin/bash
cd /tmp
sudo wget https://raw.githubusercontent.com/aldeiacloud/bookstack/main/install.sh
sudo chmod +x install.sh
sudo ./install.sh

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
