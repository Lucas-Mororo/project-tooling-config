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
