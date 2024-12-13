# docker-adianti-framework
Este repositório contém um projeto que demonstra como configurar e executar um aplicativo MadBuilder utilizando o framework Adianti Builder em um container Docker.

## Configuração do Ambiente

### Pré-requisitos
- Docker
- Docker Compose

### Passos para Configuração

# Exemplo: definir o usuário do Apache (www-data) como dono, 
# e o grupo também como www-data (pode variar dependendo do servidor)
sudo chown -R www-data:www-data app/

# Ajustar permissões de diretórios: leitura, escrita e execução para dono e grupo (775)
find app/ -type d -exec chmod 775 {} \;

# Ajustar permissões de arquivos: leitura e escrita para dono e grupo (664)
find app/ -type f -exec chmod 664 {} \;

# Caso seja necessário total liberdade (não recomendado para produção),
# pode-se usar 777 nos diretórios que precisam de escrita pelo servidor:
chmod 777 app/output/
chmod 777 tmp/
s