 - comando para construir a imagem deste exemplo
```bash
sudo docker image build -t build-copy .
```

 - comando para executar este exemplo
```bash
sudo docker container run -p 80:80 build-copy
```

