# Project Tooling Config

Este repositório é um template de configuração de ambiente para iniciar novos projetos JavaScript/TypeScript com padrões de lint, formatação e hooks Git.

## O que inclui

- `ESLint` configurado para JavaScript, TypeScript, React, Next e Node
- `Prettier` com regras de formatação compartilhadas
- `Lefthook` para hooks Git automáticos de `pre-commit` e `pre-push`
- Scripts de setup, bootstrap, limpeza, diagnóstico, release e reset
- Configuração de desenvolvimento baseada em `pnpm`

## Como usar

1. Clone este repositório, ou copie os arquivos de configuração para seu novo projeto.
2. No novo projeto, execute:

```bash
pnpm install
pnpm exec lefthook install
```

3. Execute os scripts disponíveis conforme necessário:

```bash
pnpm run lint
pnpm run lint:fix
pnpm run format
pnpm run format:check
```

Ou use os scripts prontos em `scripts/`:

- Linux/macOS: `./scripts/setup.sh`, `./scripts/bootstrap.sh`, `./scripts/clean.sh`, `./scripts/doctor.sh`, `./scripts/release.sh`, `./scripts/reset.sh`
- Windows PowerShell: `./scripts/PowerShell/setup.ps1`, `./scripts/PowerShell/bootstrap.ps1`, `./scripts/PowerShell/clean.ps1`, `./scripts/PowerShell/doctor.ps1`, `./scripts/PowerShell/release.ps1`, `./scripts/PowerShell/reset.ps1`

## Estrutura principal

- `package.json` - dependências e comandos principais
- `eslint.config.js` - ponto de entrada do ESLint
- `configs/` - configurações de ESLint, Prettier e Lefthook
- `scripts/` - automações de setup, limpeza e diagnóstico

## Recomendações

- Use este repositório como base para novos projetos
- adapte `eslint.config.js` para o tipo de projeto que está iniciando
- mantenha os arquivos em `configs/` para reutilização entre projetos
- instale os hooks com `pnpm exec lefthook install`
