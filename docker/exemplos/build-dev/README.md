 - comando para construir a imagem deste exemplo
```bash
sudo docker image build -t ex-build-dev .
```
 - **Obs** execute o comando acima da mesma pasta.

 - comando para executar este exemplo
```bash
sudo docker container run -it -v $(pwd):/app -p 80:8000 --name python-server ex-build-dev
```
