/**
 * Projeto de configuração global de tooling.
 *
 * Este arquivo é o ponto de entrada do ESLint para o repositório.
 * Ele importa um dos pacotes de configuração disponíveis em configs/eslint.
 *
 * Para projetos novos você pode escolher:
 *   - base.js        : regras gerais para JS/TS
 *   - typescript.js  : base + regras TypeScript
 *   - react.js       : TypeScript + React + acessibilidade
 *   - node.js        : TypeScript + regras Node.js
 *   - next.js        : React + Next.js
 *   - nest.js        : Node + regras específicas NestJS
 */

// import config from './configs/eslint/base.js';
import ts from "./configs/eslint/typescript.js";
// import react from './configs/eslint/react.js';

export default ts;
