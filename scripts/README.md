# Scripts de automação

Este diretório contém scripts para acelerar a configuração e manutenção do ambiente.

## Linux/macOS

- `./scripts/setup.sh` - instala dependências e configura hooks Git.
- `./scripts/bootstrap.sh` - instala dependências, hooks e valida lint/format.
- `./scripts/clean.sh` - remove `node_modules`, builds e caches.
- `./scripts/doctor.sh` - valida se Node, PNPM e Git estão instalados.
- `./scripts/release.sh` - valida lint/format e mostra o status do Git.
- `./scripts/reset.sh` - faz clean, reinstala dependências e reinstala hooks.

## Windows PowerShell

- `./scripts/PowerShell/setup.ps1`
- `./scripts/PowerShell/bootstrap.ps1`
- `./scripts/PowerShell/clean.ps1`
- `./scripts/PowerShell/doctor.ps1`
- `./scripts/PowerShell/release.ps1`
- `./scripts/PowerShell/reset.ps1`

## Uso

No Linux/macOS:

```bash
chmod +x ./scripts/*.sh
./scripts/setup.sh
```

No Windows PowerShell:

```powershell
./scripts/PowerShell/setup.ps1
```

## Objetivo

Esses scripts facilitam o provisionamento de novos ambientes de trabalho e a manutenção de projetos
compatíveis entre plataformas.
