# Git Hooks com Lefthook

Este diretório contém a configuração do Lefthook para aplicar qualidade antes de commits e push.

## Arquivo principal

- `lefthook.yml` - define ganchos Git.

## O que faz

- `pre-commit`
  - formata arquivos compatíveis com Prettier
  - aplica `eslint --fix` nos arquivos staged
- `pre-push`
  - executa `npm run lint`

## Como instalar

```bash
pnpm exec lefthook install
```

## Como usar em um novo projeto

1. Copie `configs/git/lefthook.yml` para o novo projeto.
2. Execute `pnpm exec lefthook install`.
3. Confirme que os hooks estão funcionando com um commit de teste.
