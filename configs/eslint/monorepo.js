import typescriptConfig from "./typescript.js";

export default [
  ...typescriptConfig,

  {
    ignores: ["**/.turbo/**", "**/apps/**/.next/**", "**/packages/**/dist/**"],
  },

  {
    rules: {
      /*
       * Monorepo frequentemente usa deps compartilhadas
       */
      "import/no-extraneous-dependencies": "off",
    },
  },
];
