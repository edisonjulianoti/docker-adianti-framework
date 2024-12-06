# docker-adianti-framework
Este repositório contém um projeto que demonstra como configurar e executar um aplicativo MadBuilder utilizando o framework Adianti Builder em um container Docker.

## Configuração do Ambiente

### Pré-requisitos
- Docker
- Docker Compose

### Passos para Configuração

1. Clone o repositório:
    ```bash
    git clone https://github.com/seu-usuario/docker-adianti-framework.git
    cd docker-adianti-framework
    ```

2. Crie um arquivo `.env` na raiz do projeto com as seguintes variáveis:
    ```env
    NOME_IMAGEM=zeus
    NOME_BANCO_DADOS=zeus_bd
    USUARIO_BANCO_DADOS=user_bd_root
    SENHA_BANCO_DADOS=Acesso@2020#
    ```

3. Construa e inicie os containers:
    ```bash
    docker-compose up --build
    ```

4. Após os containers estarem rodando, ajuste as permissões dos diretórios e arquivos necessários.

## Diretórios e Arquivos Especiais

### Diretórios com escrita necessária:
- `tmp/`: Usado para arquivos temporários.
- `files/`: Caso seja usado para upload ou armazenamento temporário.
- `app/output` (se existir): Normalmente usado para relatórios ou exportações.

Esses diretórios devem ter permissões de escrita para o usuário do Apache (www-data no caso do contêiner).

Comando para ajustar as permissões:
```bash
docker exec -it <nome_do_container> bash -c "chmod -R 775 /var/www/html/tmp /var/www/html/files"