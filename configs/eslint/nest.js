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
