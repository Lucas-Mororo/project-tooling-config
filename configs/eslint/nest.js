/**
 * Configuração específica para projetos NestJS.
 * Desativa regras que conflitam com o padrão de classes e decorators do Nest.
 */
import nodeConfig from "./node.js";

export default [
  ...nodeConfig,

  {
    rules: {
      /*
       * Nest usa classes extensivamente
       */
      "@typescript-eslint/no-extraneous-class": "off",

      /*
       * Decorators geram params não usados
       */
      "@typescript-eslint/no-unused-vars": [
        "warn",
        {
          argsIgnorePattern: "^_",
          varsIgnorePattern: "^_",
        },
      ],
    },
  },
];
