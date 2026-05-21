/**
 * Extensão da configuração base para projetos TypeScript.
 * Inclui as regras recomendadas do plugin @typescript-eslint e ajustes
 * para evitar falsos positivos com variáveis/descarte de argumentos.
 */
import tseslint from "typescript-eslint";

import baseConfig from "./base.js";

export default [
  ...baseConfig,

  ...tseslint.configs.recommended,

  {
    rules: {
      "no-unused-vars": "off",

      "@typescript-eslint/no-unused-vars": [
        "error",
        {
          argsIgnorePattern: "^_",
          varsIgnorePattern: "^_",
        },
      ],

      "@typescript-eslint/consistent-type-imports": "error",
    },
  },
];
