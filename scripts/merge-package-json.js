#!/usr/bin/env node
/* eslint no-undef: 0 */
import { readFile, writeFile } from "fs/promises";
import { dirname, resolve } from "path";
import { fileURLToPath } from "url";

const scriptDir = dirname(fileURLToPath(import.meta.url));
const templateRoot = resolve(scriptDir, "..");

const args = process.argv.slice(2);
let targetRoot = ".";
let shouldInstall = false;
for (const arg of args) {
  if (arg === "--install") {
    shouldInstall = true;
    continue;
  }
  if (!arg.startsWith("--")) {
    targetRoot = arg;
  }
}

const targetPackagePath = resolve(targetRoot, "package.json");
const templatePackagePath = resolve(templateRoot, "package.json");

function uniqueArray(items) {
  return [...new Set(items.filter(Boolean))];
}

async function exists(path) {
  try {
    await readFile(path, "utf8");
    return true;
  } catch {
    return false;
  }
}

async function loadJson(path) {
  try {
    return JSON.parse(await readFile(path, "utf8"));
  } catch (error) {
    throw new Error(`Falha ao ler JSON em ${path}: ${error.message}`);
  }
}

async function saveJson(path, value) {
  const text = JSON.stringify(value, null, 2) + "\n";
  await writeFile(path, text, "utf8");
}

function mergeScripts(targetScripts, templateScripts) {
  const keys = [
    "format",
    "format:check",
    "lint",
    "lint:fix",
    "prepare",
    "bootstrap",
  ];
  const result = { ...targetScripts };
  const changes = [];

  for (const key of keys) {
    if (!(key in result) && key in templateScripts) {
      result[key] = templateScripts[key];
      changes.push(`added script ${key}`);
    }
  }

  return { result, changes };
}

function mergeDependencies(targetDeps, templateDeps) {
  const result = { ...targetDeps };
  const changes = [];

  for (const [key, version] of Object.entries(templateDeps ?? {})) {
    if (!(key in result)) {
      result[key] = version;
      changes.push(`added devDependency ${key}@${version}`);
    }
  }

  return { result, changes };
}

async function main() {
  const templatePackage = await loadJson(templatePackagePath);
  const targetExists = await exists(targetPackagePath);
  let targetPackage = targetExists ? await loadJson(targetPackagePath) : {};

  if (!targetExists) {
    targetPackage = {
      name: "project",
      private: true,
      version: "1.0.0",
    };
    console.log(`Criando novo package.json em ${targetPackagePath}`);
  }

  if (!targetPackage.private) {
    targetPackage.private = true;
    console.log("Definido private: true");
  }

  if (templatePackage.packageManager && !targetPackage.packageManager) {
    targetPackage.packageManager = templatePackage.packageManager;
    console.log(`Definido packageManager: ${templatePackage.packageManager}`);
  }

  if (templatePackage.workspaces) {
    targetPackage.workspaces = uniqueArray([
      ...(targetPackage.workspaces ?? []),
      ...templatePackage.workspaces,
    ]);
    console.log(
      `Mesclado workspaces: ${JSON.stringify(targetPackage.workspaces)}`,
    );
  }

  targetPackage.scripts ??= {};
  const scriptMerge = mergeScripts(
    targetPackage.scripts,
    templatePackage.scripts ?? {},
  );
  targetPackage.scripts = scriptMerge.result;
  scriptMerge.changes.forEach((change) => console.log(change));

  targetPackage.devDependencies ??= {};
  const depMerge = mergeDependencies(
    targetPackage.devDependencies,
    templatePackage.devDependencies ?? {},
  );
  targetPackage.devDependencies = depMerge.result;
  depMerge.changes.forEach((change) => console.log(change));

  await saveJson(targetPackagePath, targetPackage);
  console.log(`package.json atualizado: ${targetPackagePath}`);

  if (shouldInstall) {
    process.chdir(targetRoot);
    console.log("Executando pnpm install...");
    const { spawn } = await import("child_process");
    const child = spawn("pnpm", ["install"], { stdio: "inherit" });
    child.on("exit", (code) => process.exit(code ?? 0));
  }
}

main().catch((error) => {
  console.error(error);
  process.exit(1);
});
