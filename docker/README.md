### Comandos básicos
 - É possível atribuir uma tag para uma imagem do docker com o seguinte comando:
```bash
docker image tag redis:latest ultima-versao-redis
```
Este comando faz uma cópia da imagem **redis:latest** para uma nova imagem identificada com a tag **ultima-versao-redis**. Isto pode ser verificado através do *hash* das imagens.

 - O comando seguinte faz o download da imagem informada para a máquina local.
```bash
docker image pull nginx:latest
```

 - A remoção de uma imagem docker que está no cache local da máquina é o comando:
```bash
docker image rm nginx:latest
```
Para remover duas ou mais imagens de uma só vez, simplesmente passe o nome do repository dela:
```bash
docker image rm nginx:latest redis:latest
```

 - O comando seguinte faz o upload da imagem informada para a Docker Hub.
```bash
docker image push meu-nginx-configurado
```

 - O comando seguinte faz a listagem das imagens que estão no cache da máquina local.
```bash
docker image ls
```

 - O comando a seguir tem como resultado um retorno em formato *json* de informações sobre a imagem especificada no comando.
```bash
docker image inspect nginx:latest
```

 - O comando a seguir tem como objetivo construir uma imagem do docker a partir de um arquivo descritor, chamado de **Dockerfile**. Este comando deve ser executado na pasta onde o arquivo mencionado reside.
```bash
docker image build
```

### Construindo imagens
 - O arquivo descritor do de um build do Docker é o **Dockerfile**. Segue nosso primeiro descritor de exemplo.
```dockerfile
# as linhas que começam com tralha (#) são comentários a menos que seja uma diretiva válida do docker
# o comando FROM indica de qual imagem este construção vai se basear
FROM nginx:latest
# o comando RUN cria uma nova layer no sistema de arquivos através da execução do comando informado
RUN echo '<h1>Hello World</h1>' > /usr/share/nginx/html/index.html
```
 - Para executar este arquivo do Docker e criar a imagem em si, é necessário executar o comando a seguir na linha de comandos. Este comando constroi a imagem, a partir do arquivo **Dockerfile** criado acima.
```bash
sudo  docker image build -t primeiro-build .
```
 - **Obs** Os parâmetros passados para o comando foram **-t** para dar uma tag a imagem recem criada e, **.** para informar em qual diretório está o arquivo descritor.
 - **Obs** Para saber se a imagem foi criada com sucesso execute o comando *sudo docker image ls*.
 - **Obs** Para executar a image que acabou de ser criada com a tag **primeiro-build**, execute *sudo docker container run -p 80:80 primeiro-build*.
 - **Obs** Como essa é uma imagem do **nginx** e foi mapeado para a porta 80, basta acessar **http://localhost**.

 - O proximo exemplo é quando é preciso passar argumentos no momento de build da imagem. Segue comando.
```dockerfile
FROM debian
LABEL maintainer 'Aluno Cod3r <aluno at cod3r.com.br>'
# cria um argumento que será recebido no momento do build com a flag --build-arg
ARG S3_BUCKET=files
ENV S3_BUCKET=${S3_BUCKET}
```
 - Para executar este arquivo do Docker e criar a imagem em si, é necessário executar o comando a seguir na linha de comandos. Este comando constrói a imagem, a partir do arquivo **Dockerfile** criado acima.
```bash
sudo docker image build --build-arg S3_BUCKET=myapp -t build-arg .
```
 - **Obs** Os parâmetros passados para o comando foram **-t** para dar uma tag a imagem recem criada e, **.** para informar em qual diretório está o arquivo descritor.
 - **Obs** O parâmetro **- - build-arg** serve para indicar quais parâmetros de linha de comandos devem ser considerados argumentos do arquivo **Dockerfile**.
