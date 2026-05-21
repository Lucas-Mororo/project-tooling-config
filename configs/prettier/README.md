# Prettier Configuration

Esta pasta contém as regras de formatação do Prettier usadas pelo template.

## Arquivos

- `.prettierrc.json` - regras de formatação compartilhadas.
- `.prettierignore` - arquivos e pastas que não devem ser formatados.

## Regras aplicadas

- `semi: true` - ponto e vírgula obrigatório
- `singleQuote: true` - aspas simples
- `trailingComma: all` - vírgula final em objetos/arrays
- `printWidth: 100` - largura máxima de linha
- `tabWidth: 2` - indentação de 2 espaços
- `arrowParens: always` - parênteses sempre em arrow functions
- `endOfLine: lf` - fim de linha LF

## Uso

- `pnpm exec prettier --write .`
- `pnpm run format`
- `pnpm run format:check`
