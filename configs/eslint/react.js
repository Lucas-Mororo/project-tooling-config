/**
 * Configuração para projetos React/Next.js.
 * Adiciona checagens de JSX, hooks e acessibilidade no fluxo de lint.
 */
import jsxA11y from "eslint-plugin-jsx-a11y";
import reactPlugin from "eslint-plugin-react";
import reactHooks from "eslint-plugin-react-hooks";
import globals from "globals";

import typescriptConfig from "./typescript.js";

export default [
  ...typescriptConfig,

  {
    files: ["**/*.{js,jsx,ts,tsx}"],

    languageOptions: {
      globals: {
        ...globals.browser,
      },
    },

    plugins: {
      react: reactPlugin,
      "react-hooks": reactHooks,
      "jsx-a11y": jsxA11y,
    },

    rules: {
      ...reactPlugin.configs.recommended.rules,
      ...reactHooks.configs.recommended.rules,
      ...jsxA11y.configs.recommended.rules,

      "react/react-in-jsx-scope": "off",

      "react/prop-types": "off",
    },

    settings: {
      react: {
        version: "detect",
      },
    },
  },
];
