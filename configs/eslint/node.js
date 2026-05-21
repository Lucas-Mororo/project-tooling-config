import nodePlugin from "eslint-plugin-n";
import globals from "globals";

import typescriptConfig from "./typescript.js";

export default [
  ...typescriptConfig,

  {
    files: ["**/*.{js,mjs,cjs,ts}"],

    languageOptions: {
      globals: {
        ...globals.node,
      },
    },

    plugins: {
      n: nodePlugin,
    },

    rules: {
      ...nodePlugin.configs["flat/recommended"].rules,

      "n/no-process-exit": "off",
    },
  },
];
