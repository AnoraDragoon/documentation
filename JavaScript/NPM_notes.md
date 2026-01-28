# NPM Notes

## Commands

For definitive documentation

```bash
npm help init
```

Fast ``package.json`` initialization. No questions.
``package.json`` initialiced contain default data pre-setted data from npm configuration

```bash
npm init --yes | npm init -y
```

Setting config values for ``packaga.json`` initialization

```bash
npm config set init-author-name "Tu Nombre";
npm config set init-author-email "TuEmail@email.com";
npm config set init-author-url "https://tuWeb.com";
npm config set init-license "MIT";
npm config set init-version "0.0.1";
```

Install a package and save it as a dependency in the `package.json` file.
`npm install <package>` | `npm i <package>`

Install a local dependency, “save” flag is default behavior.
Local dependencies are on `dependencies` section on our project `package.json`

```bash
npm install --save <package>
```

Install a development local dependency.
Local development dependencies are on "devDependencies" section on our project "package.json"

```bash
npm install --save-dev <package> | npm install -D <package>
```

Install a global dependency

```bash
npm install --global <package> | npm install -g <package>
```

Install a specific dependency version.

```bash
npm install <package>@<versión>
```

Simulate an installation. It show the same report as a real installation without install the dependency.

```bash
npm install --dry-run <package>
```

Force is required to install a too recent dependency version. No stable version.

```bash
npm install --force <package> | npm install -f <package>
```

List all global dependencies on depth level 0.

```bash
npm list -g --depth 0
```

Show information about fund packages.

```bash
npm fund
```

Check all available updates for dependencies.

```bash
npm outdate
```

Show an extended report for available updates.
Flag "dd" Check Flags section.

```bash
npm outdate --dd
```

Upgrade every packages to lates or stable version.

```bash
npm update
```

Upgrade a specific package.

```bash
npm install <package>@latest
```

Uninstall the package and remove it from "package.json".

```bash
npm uninstall <package>
```

Uninstall package from "node_modules" but It doesn't remove it from "package.json".

```bash
npm uninstall --no-save <paquete>
```

Remove cache.
This command could be necessary before run `npm i` to solve some errors related with corrupted installations.

```bash
npm cache clear --force
```

Verify cache status

```bash
npm cache verify
```

Show a report about all installed dependencies, updates, vulnerabilities and their impact.

```bash
npm audit
```

Save audit report on a json file.

```bash
npm audit --json
```

Show audit report and try to fix vulnerabilities updating dependencies.
It works like `npm update`.

```bash
npm audit fix
```

## Package versions

- Version example: ``5.3.12 => <major>.<minor>.<patch>``
\
Symbols: Caret ^  and  Tilde ~
\
Caret: allows to update minor and patch versions. ("5.3.12" => "5.4.14")
\
Tilde: allows to update just patch version.  ("5.3.12" => "5.3.14")

## Scripts

On "`package.json`" file there is a section calls "`scripts`".

```json
{
    //...
    "scripts": {
        "<script_name>": "<command>"
        //...
    }
    //...
}
```

These scripts could be executed like this:

```sh
npm run <script_name>
```

Examples:

- package.json:

```json
"scripts": {
    "start": "webpack-dev-server --open --mode development",
    "build": "webpack --mode production",
    "deploy": "npm run format && npm run build"
}
```

- commands:

```bash
npm run start
npm run build
npm run deploy
```

Flags:

``dd`` => Verbose mode. It is like a log report. Available for every or almost every commands.

Example:

```bash
npm outdate --dd
```

## Recommended reading

- Snyk | Developer security | Develop fast. Stay secure.
<https://snyk.io>
