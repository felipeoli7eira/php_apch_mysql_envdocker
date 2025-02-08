# PHP, APACHE, MYSQL env

Antes de mais nada, você precisa instalar no seu sistema operacional a ferramenta [taskfile.dev](https://taskfile.dev/) pois essa estrutura de projeto foi pensada para usar essa ferramenta como CLI para fazer o setup e com ela será mais simples executar comandos e fazer configurações do projeto. Veja a [página de instalação](https://taskfile.dev/installation/) para o seu sistema.

O objetivo desse repositório é subir esses serviços facilmente com o docker e uma estrutura básica.

# Comandos

Ao baixar esse repositório, execute o comando:
> task setup

Parando os containeres:
> task stop

Ao invés do comando ```setup```, execute esse comando para iniciar os containeres em todas as próximas vezes após a primeira vez:
> task start

Crie novos comandos editando o arquivo [Taskfile](./Taskfile.yml).

Para ver a lista completa dos comandos disponíveis, execute:
> task --list

Ou entre no arquivo [Taskfile](./Taskfile.yml) e veja como tudo está configurado.

[Documentação do taskfile](https://taskfile.dev)
