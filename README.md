<h2>Wiki Bookstack na AWS de uma forma rápida!</h2>

<b>RESUMO: <br>Configuração de uma aplicação Bookstack com Apache.<br>
Contém certificado SSL LetsEncrypt com renovação automática e redirecionamento de HTTP para HTTPS.</b>

 <b>Extras:</b>
  - Altera o horário do Ubuntu para GMT-3;
  - Configura 2GB de Swap e adiciona no /etc/fstab.

<b>Vídeo da implementação: https://www.youtube.com/watch?v=</b>

------------------------------------------------------------------------------

<b>1- </b>AO <b>FINAL DA PÁGINA</b> DE CONFIGURAÇÃO DA ZONA/VPC DA EC2, ADICIONAR AS LINHAS ABAIXO À CAIXA EM BRANCO:

#!/bin/bash<br>
cd /tmp<br>
sudo wget https://raw.githubusercontent.com/aldeiacloud/bookstack/main/install.sh<br>
sudo chmod +x install.sh<br>
sudo ./install.sh<br>

------------------------------------------------------------------------------

<b>2-</b> Atachar um <b>Elastic IP</b> na instância;<br>

------------------------------------------------------------------------------

<b>3-</b> Fazer um apontamento na tabela de DNS para o IP da sua instância;<br>

------------------------------------------------------------------------------

<b>4-</b> Adicionar o subdomínio no <b>"ServerName" do bookstack.conf</b> dentro de <b>"/etc/apache2/sites-enable/"</b>;<br>

------------------------------------------------------------------------------

<b>5-</b> Alterar a <b>URL da aplicação</b> e configurar o <b>smtp da aplicação</b> no ".ENV";<br>
vim /var/www/bookstack/.env<br>

------------------------------------------------------------------------------

<b>6-</b> Instalar o certificado LetsEncrypt.</b><br>
sudo certbot --apache
