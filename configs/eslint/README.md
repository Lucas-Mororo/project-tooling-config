# ESLint Configurations

Este diretório contém várias configurações ESLint públicas para diferentes tipos de projeto.

## Arquivos

- `base.js` - regras comuns para JavaScript/TypeScript, import sorting e integração com Prettier.
- `typescript.js` - estende `base.js` com regras do `@typescript-eslint`.
- `react.js` - estende `typescript.js` com regras de React, React Hooks e acessibilidade.
- `node.js` - estende `typescript.js` para projetos Node.js.
- `next.js` - estende `react.js` para projetos Next.js.
- `nest.js` - estende `node.js` com ajustes para NestJS.

## Como escolher

No arquivo `eslint.config.js` do projeto, importe a configuração adequada:

```js
import ts from "./configs/eslint/typescript.js";
export default ts;
```

Para projetos React:

```js
import react from "./configs/eslint/react.js";
export default react;
```

Para Next.js:

```js
import nextConfig from "./configs/eslint/next.js";
export default nextConfig;
```

## Dicas

- Use `base.js` como ponto de partida para projetos simples.
- Use `typescript.js` quando o projeto for TypeScript.
- Use `node.js` para aplicações backend Node.
- Use `nest.js` se estiver criando um projeto NestJS.
