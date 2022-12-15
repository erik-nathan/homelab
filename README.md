# O meu HomeLab

Tinha um PC que estava parado e decidi utiliza-lo e transforma em um servidor.
Sua configuração: processador Intel I5-9, 8GB de memória Ram, 240GB de SSD e 1TB de HD.
Essa configurações devem suprir tudo que eu pretendo rodar nele. Como admirador do open source em específico do Linux, o sistema operacional que vai rodar ele será o Ubuntu Server.

## O que será executado no servidor?

Inicialmente a ideia é roda tudo ou a maioria através de container usando o Docker
Alguns serviços:

- Jenkins
- Portainer
- n8n
- Postgres
- Python

## Començando o Servidor

Para iniciar o servidor, instalar o **Ubuntu Server** e logo após executar o `installtools.sh`, para instalar as ferramentas iniciais, mas antes e preciso da permissão para o script

```bash
sudo chmod u+x installtools.sh
./installtools.sh
```

## Utilidades

Dentro do diretório utilidades possui alguns scripts para ajudar a manter o sistema atualizado

```bash
├── utilidades
│   └── dockerstart.sh   # script para instalar os docker composes
└──
```
