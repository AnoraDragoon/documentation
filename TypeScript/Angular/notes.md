# Notes

## Configure Angular CLI to use Bun as Package Manager

This command sets Bun as the global default package manager for Angular CLI:

```bash
ng config -g cli.packageManager bun
```

**Parameters:**

- `-g` or `--global`: Sets the configuration globally for all Angular projects
- `cli.packageManager`: The configuration key for specifying the package manager
- `bun`: The package manager to use (alternatives: `npm`, `yarn`, `pnpm`)

**Result:** All new Angular projects will use Bun for package management operations like installing dependencies and running scripts.
