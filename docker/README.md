### Comandos básicos
 1. O passos abaixo servem para fazer o upload de uma imagem local para o Docker Hub:
```bash
# vale lembrar que é necessário uma conta do serviço do Docker Hub
sudo docker image tag ex-simple-build <username>/simple-build:1.0
# o comando acima cria a tag simple-build, na versão 1.0, para a imagem ex-simple-build
# a mesma pode ser listada com o comando: docker image ls
sudo docker login --username=pedroferreiracjr
# o comando acima faz o login no username informado, a senha será solicitada
sudo docker image push <username>/simple-build:1.0
```

 2. É possível atribuir uma tag para uma imagem do docker com o seguinte comando:
```bash
docker image tag redis:latest ultima-versao-redis
```
Este comando faz uma cópia da imagem **redis:latest** para uma nova imagem identificada com a tag **ultima-versao-redis**. Isto pode ser verificado através do *hash* das imagens.

 3. O comando seguinte faz o download da imagem informada para a máquina local.
```bash
docker image pull nginx:latest
```

 4. A remoção de uma imagem docker que está no cache local da máquina é o comando:
```bash
docker image rm nginx:latest
```
Para remover duas ou mais imagens de uma só vez, simplesmente passe o nome do repository dela:
```bash
docker image rm nginx:latest redis:latest
```

 5. O comando seguinte faz o upload da imagem informada para a Docker Hub.
```bash
docker image push meu-nginx-configurado
```

 6. O comando seguinte faz a listagem das imagens que estão no cache da máquina local.
```bash
docker image ls
```

 7. O comando a seguir tem como resultado um retorno em formato *json* de informações sobre a imagem especificada no comando.
```bash
docker image inspect nginx:latest
```

 8. O comando a seguir tem como objetivo construir uma imagem do docker a partir de um arquivo descritor, chamado de **Dockerfile**. Este comando deve ser executado na pasta onde o arquivo mencionado reside.
```bash
docker image build
```

### Construindo imagens
 1. O arquivo descritor do de um build do Docker é o **Dockerfile**. Segue nosso primeiro descritor de exemplo.
```dockerfile
# as linhas que começam com tralha (#) são comentários a menos que seja uma diretiva válida do docker
# o comando FROM indica de qual imagem este construção vai se basear
FROM nginx:latest
# o comando RUN cria uma nova layer no sistema de arquivos através da execução do comando informado
RUN echo '<h1>Hello World</h1>' > /usr/share/nginx/html/index.html
```
 - **Obs:** Para executar este arquivo do Docker e criar a imagem em si, é necessário executar o comando a seguir na linha de comandos. Este comando constrói a imagem, a partir do arquivo **Dockerfile** criado acima.
```bash
sudo  docker image build -t primeiro-build .
```
 - **Obs:** Os parâmetros passados para o comando foram **-t** para dar uma tag a imagem recem criada e, **.** para informar em qual diretório está o arquivo descritor.
 - **Obs:** Para saber se a imagem foi criada com sucesso execute o comando *sudo docker image ls*.
 - **Obs:** Para executar a image que acabou de ser criada com a tag **primeiro-build**, execute *sudo docker container run -p 80:80 primeiro-build*.
 - **Obs:** Como essa é uma imagem do **nginx** e foi mapeado para a porta 80, basta acessar **http://localhost**.

 2. O próximo exemplo é quando é preciso passar argumentos no momento de build da imagem. Segue comando.
```dockerfile
FROM debian
LABEL maintainer 'Aluno Cod3r <aluno at cod3r.com.br>'
# cria um argumento que será recebido no momento do build com a flag --build-arg
ARG S3_BUCKET=files
ENV S3_BUCKET=${S3_BUCKET}
```
 - **Obs:** Para executar este arquivo do Docker e criar a imagem em si, é necessário executar o comando a seguir na linha de comandos. Este comando constrói a imagem, a partir do arquivo **Dockerfile** criado acima.
```bash
sudo docker image build --build-arg S3_BUCKET=myapp -t build-arg .
```
 - **Obs** Os parâmetros passados para o comando foram **-t** para dar uma tag a imagem recem criada e, **.** para informar em qual diretório está o arquivo descritor.
 - **Obs** O parâmetro **- - build-arg** serve para indicar quais parâmetros de linha de comandos devem ser considerados argumentos do arquivo **Dockerfile**.

 3. Para limpar o histórico de execução dos containers que já foram executados, é possível usar o comando abaixo.
```bash
sudo docker container prune
```
- **Obs:** Este comando pede confirmação antes que a operação seja executada, e retorna o hash de todos os containers que foram removidos.

 4. Para listar as redes disponíveis, use o comando a seguir.
```bash
sudo docker network ls
```

 5. Para listar as redes disponíveis, use o comando a seguir.
```bash
sudo docker container run --rm --net none alpine ash -c "ifconfig"
```
 - **Obs:** O parâmetro **- - rm** foi usado para indicar que não deve ser salvo no histórico de execução de containers.
 - **Obs:** O parâmetro **- - net none** foi usado para indicar que este container deve ser executado sem acesso a rede, ou seja, rede em modo none.

 6. Para remover uma rede, use o comando.
```bash
sudo docker network rm <NETWORK ID/NAME>
```

 7. É possível inspecionar uma rede previamente criada com o comando a seguir.
```bash
sudo docker network inspect bridge
```
- **Obs:** O parâmetro **brigde** é uma rede que é configurada por padrão no Docker Engine.

 8. Com o comando a seguir é possível criar uma nova faixa de rede de classificação B.
```bash
sudo docker network create --driver bridge rede_nova
```
- **Obs:** Com o comando *docker network inspect rede_nova* é possível inspecionar a nova rede para saber qual a faixa de IP.

 9. Também é possível adicionar um container a uma rede existente.
```bash
sudo docker network connect <NETWORK ID/NAME> <CONTAINER ID>
```

 10. Por outro lado, também é possível remover um container de uma rede.
```bash
sudo docker network disconnect <NETWORK ID/NAME> <CONTAINER ID>
```
