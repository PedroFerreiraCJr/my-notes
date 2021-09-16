# o objetivo deste exemplo é fazer a cópia do arquivo index.html para dentro do container através do comenado COPY
FROM nginx:latest
LABEL maintainer 'Aluno Cod3r'

RUN echo '<h1>Sem conteudo</h1>' > /usr/share/nginx/html/conteudo.html
COPY *.html /usr/share/nginx/html/
