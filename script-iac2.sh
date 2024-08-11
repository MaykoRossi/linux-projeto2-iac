#!/bin/bash

# Atualizar o servidor
echo "Atualizando o servidor..."
sudo apt-get update && sudo apt-get upgrade -y

# Instalar o Apache2
echo "Instalando o Apache2..."
sudo apt-get install apache2 -y

# Instalar o unzip
echo "Instalando o unzip..."
sudo apt-get install unzip -y

# Baixar a aplicação
echo "Baixando a aplicação..."
wget -O /tmp/linux-site-dio.zip https://github.com/denilsonbonatti/linux-site-dio/archive/refs/heads/main.zip

# Descompactar a aplicação
echo "Descompactando a aplicação..."
sudo unzip /tmp/linux-site-dio.zip -d /tmp

# Copiar os arquivos da aplicação para o diretório padrão do Apache
echo "Copiando os arquivos da aplicação para o diretório do Apache..."
sudo cp -r /tmp/linux-site-dio-main/* /var/www/html/

# Limpar arquivos temporários
echo "Limpando arquivos temporários..."
rm /tmp/linux-site-dio.zip
rm -rf /tmp/linux-site-dio-main

# Reiniciar o Apache para garantir que as mudanças entrem em vigor
echo "Reiniciando o Apache..."
sudo systemctl restart apache2

echo "Provisionamento concluído com sucesso!"
