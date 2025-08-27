# 🚀 Deploy Automático com Docker Compose

Este script bash foi criado para facilitar o processo de **deploy automático** de projetos que utilizam **Git** e **Docker Compose**.
Ideal para ambientes de desenvolvimento, staging ou até produção em servidores pessoais.

---

## 📦 O que o script faz?

1. Exibe o diretório atual e o estado do Git
2. Faz `git pull` para obter as últimas alterações
3. Mostra o último commit aplicado
4. Para os containers existentes (`docker compose down`)
5. Constrói e sobe os containers novamente (`docker compose up -d --build`)
6. Exibe mensagens claras de sucesso ou erro

---

## 🧰 Requisitos

- Git instalado
- Docker e Docker Compose instalados
- Permissões para executar scripts (`chmod +x deploy.sh`)
- Um repositório Git válido com `docker-compose.yml` na raiz

---

## ▶️ Como usar

1. **Clone o repositório** no servidor:
   ```bash
   git clone https://github.com/seu-usuario/seu-repositorio.git
   cd seu-repositorio
   ```

2. **Torna o script executável:**
   ```bash
   chmod +x deploy.sh
   ```

3. **Executa o deploy:**
   ```bash
   ./deploy.sh
   ```

---

## 💡 Dica extra

Podes usar um **alias no terminal** para facilitar ainda mais:
```bash
alias deployme='bash /caminho/para/deploy.sh'
```

Ou agendar o deploy com `cron`, `systemd timer` ou integrar num `Git hook`.

---

## 📁 Estrutura esperada do projeto

```
.
├── deploy.sh
├── docker-compose.yml
└── (outros ficheiros do teu projeto)
```

---

## 🛟 Possíveis melhorias futuras

- Notificações (email, Slack, Telegram)
- Backup automático antes de subir containers
- Suporte para múltiplos ambientes (dev/stage/prod)

---

## 📜 Licença

Distribuído sob a licença MIT. Usa à vontade!

---

## 🤘 Feito com dedicação por p0k4 💻
