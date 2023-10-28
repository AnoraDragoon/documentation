# NPM Notes

## Commands:

For definitive documentation
```
npm help init
```

Fast ``package.json`` initialization. No questions.
``package.json`` initialiced contain default data pre-setted data from npm configuration
```
npm init --yes | npm init -y
```

Setting config values for ``packaga.json`` initialization
```
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
```
npm install --save <package>
```

Install a development local dependency.
Local development dependencies are on "devDependencies" section on our project "package.json"
```
npm install --save-dev <package> | npm install -D <package>
```

Install a global dependency
```
npm install --global <package> | npm install -g <package>
```

Install a specific dependency version.
```
npm install <package>@<versión>
```

Simulate an installation. It show the same report as a real installation without install the dependency.
```
npm install --dry-run <package>
```

Force is required to install a too recent dependency version. No stable version.
```
npm install --force <package> | npm install -f <package>
```

List all global dependencies on depth level 0.
```
npm list -g --depth 0
```

Show information about fund packages.
```
npm fund
```

Check all available updates for dependencies.
```
npm outdate
```

Show an extended report for available updates.
Flag "dd" Check Flags section.
```
npm outdate --dd
```

Upgrade every packages to lates or stable version.
```
npm update
```

Upgrade a specific package.
```
npm install <package>@latest
```

Uninstall the package and remove it from "package.json".
```
npm uninstall <package>
```

Uninstall package from "node_modules" but It doesn't remove it from "package.json".
```
npm uninstall --no-save <paquete>
```

Remove cache.
This command could be necessary before run `npm i` to solve some errors related with corrupted installations.
```
npm cache clear --force
```

Verify cache status
```
npm cache verify
```

Show a report about all installed dependencies, updates, vulnerabilities and their impact.
```
npm audit
```

Save audit report on a json file.
```
npm audit --json
```

Show audit report and try to fix vulnerabilities updating dependencies.
It works like `npm update`.
```
npm audit fix
```

## Package versions:

- Version example: ``5.3.12 => <major>.<minor>.<patch>``
<br>
Symbols: Caret ^  and  Tilde ~
<br>
Caret: allows to update minor and patch versions. ("5.3.12" => "5.4.14")
<br>
Tilde: allows to update just patch version.  ("5.3.12" => "5.3.14")

## Scripts:

On "`package.json`" file there is a section calls "`scripts`".
```
{
    ...
    "scripts": {
        "<script_name>": "<command>"
        ...
    }
    ...
}
```

These scripts could be executed like this:
```
npm run <script_name>
```

Examples:
- package.json:
```
"scripts": {
    "start": "webpack-dev-server --open --mode development",
    "build": "webpack --mode production",
    "deploy": "npm run format && npm run build"
}
```

- commands:
```
npm run start
npm run build
npm run deploy
```

Flags:

``dd`` => Verbose mode. It is like a log report. Available for every or almost every commands.

Example:
```
npm outdate --dd
```

## Recommended reading:

- Snyk | Developer security | Develop fast. Stay secure.
https://snyk.io
