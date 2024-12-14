# Arquivos de Configuração do Docker

Este repositório apresenta exemplos de arquivos de configuração do Docker, fornecendo um ponto de partida para que você possa preparar o ambiente necessário para rodar o seu aplicativo MadBuilder.

## Objetivo dos Arquivos

- **Dockerfile:**  
  Descreve o ambiente básico da imagem Docker, incluindo sistema operacional, instalações de pacotes, extensões PHP e configurações do servidor web. Ao ajustar o Dockerfile, você define o que o container terá disponível (por exemplo, extensões PHP específicas, ferramentas de linha de comando e ajustes de performance).

- **docker-compose.yml:**  
  Orquestra múltiplos serviços, como o servidor web (Apache ou Nginx) e o banco de dados (PostgreSQL ou MySQL), permitindo que todos sejam iniciados com um único comando. Aqui você define portas, volumes e variáveis de ambiente, simplificando a inicialização do ambiente completo.

## Ajustando para seu Ambiente

- **Portas:**  
  Se a sua aplicação web precisa rodar em outra porta que não a padrão (80 ou 8080), basta editar a seção `ports:` no `docker-compose.yml`.

- **Banco de Dados:**  
  O `docker-compose.yml` permite definir o nome do banco, usuário e senha em variáveis de ambiente. Ajuste esses valores conforme necessário. Por exemplo, altere `POSTGRES_USER`, `POSTGRES_PASSWORD` e `POSTGRES_DB` para corresponder às credenciais desejadas.

- **Extensões PHP e Pacotes:**  
  Caso sua aplicação necessite de extensões PHP adicionais, basta acrescentá-las na linha de instalação do `Dockerfile`. O mesmo vale para pacotes do sistema operacional. Ajuste o `RUN apt-get install -y ...` conforme a necessidade do seu projeto.

- **Volumes (Persistência de Dados):**  
  Se quiser que dados persistam entre reinicializações do container (como o banco de dados ou arquivos de uploads), confira a seção `volumes:` no `docker-compose.yml`. Altere caminhos de mapeamento para adequar à sua estrutura.

## Como Subir a Imagem do Aplicativo

1. **Personalize os Arquivos:**  
   Edite o Dockerfile e o docker-compose.yml conforme descrito acima, ajustando portas, variáveis de ambiente, pacotes e extensões PHP.

2. **Construir e Iniciar os Containers:**  
   Após as edições, basta rodar:
   ```bash
   docker-compose up --build
