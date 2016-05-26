FROM asciidoctor/docker-asciidoctor:latest

ADD run.sh /

VOLUME /target

CMD ["sh", "/run.sh"]
