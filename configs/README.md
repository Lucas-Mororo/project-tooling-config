# Configurações compartilhadas

Esta pasta reúne as configurações de lint, formatação e git hooks que devem ser reutilizadas em novos projetos.

## Estrutura

- `eslint/` - configs de ESLint para diferentes tipos de projeto
- `git/lefthook.yml` - hooks Git para formatação e lint antes do commit/push
- `prettier/` - regras de formatação com Prettier

## Como usar

1. Copie `configs/` para seu novo projeto.
2. Ajuste `eslint.config.js` para escolher o pacote adequado.
3. Instale dependências com `pnpm install`.
4. Instale os hooks com `pnpm exec lefthook install`.

## Notas

- `configs/prettier/` contém tanto a configuração quanto a ignore list do Prettier.
- `configs/git/lefthook.yml` já aplica formatação e lint nos arquivos staged.
- Os arquivos dentro de `configs/eslint/` são modulares e podem ser combinados.
