import js from "@eslint/js";
import prettier from "eslint-config-prettier";
import simpleImportSort from "eslint-plugin-simple-import-sort";

export default [
  {
    ignores: [
      "**/node_modules/**",
      "**/dist/**",
      "**/build/**",
      "**/.next/**",
      "**/coverage/**",
      "**/.turbo/**",
    ],
  },

  js.configs.recommended,

  {
    plugins: {
      "simple-import-sort": simpleImportSort,
    },

    rules: {
      "simple-import-sort/imports": "error",
      "simple-import-sort/exports": "error",

      // 'no-console': ['warn', { allow: ['warn', 'error'], },],

      eqeqeq: ["error", "always"],

      "no-var": "error",

      "prefer-const": "error",
    },
  },

  prettier,
];
