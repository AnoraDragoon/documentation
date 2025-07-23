# Guía de Buenas Prácticas para Proyectos Angular

Esta guía proporciona una configuración recomendada para mantener un código limpio y consistente en proyectos Angular, incluyendo la instalación y configuración de **Prettier**, **ESLint** y **EditorConfig**.

> **⚠️ Nota:** ¿Por qué es necesario?
>
> - Al codificar tenemos que tener en cuenta el formato para que el código sea legible.
> - Durante la revisión de las Pull Request se eliminan cambios de alteraciones del formato del código que no aportan valor, lo que hace las PR mas resumidas y fáciles de revisar.
> - Informa y corrige la de importación de dependencias innecesarias y otras malas prácticas que reducen la calidad del código.
> - Automatizarlo permite abstraernos de esta tarea y permite que la técnología se haga cargo, para centrar el exfuerzo en lo que aporta valor a al desarrollo, mejorando el rendimiento.

---

## 📝 Configuración de EditorConfig

**EditorConfig** es un complemento de formato compatible con muchas tecnologías que ayuda a automatizar el formateo del código.
Al ser compatible con multiples tecnologías en especial IDEs de desarrollo, no importa si otros miembros del equipo utilizan uno distingo,
El formato del código será el mismo si todos tienen el pluging instalado.

Al generar un nuevo proyecto de Angular trae por defecto el archivo `.editorconfig` en la raíz del proyecto:

```conf
root = true

[*]
charset = utf-8
indent_style = space
indent_size = 2
insert_final_newline = true
trim_trailing_whitespace = true
max_line_length = 100

[*.ts]
quote_type = single

[*.md]
max_line_length = off
trim_trailing_whitespace = false
```

La configuración recomendada en esta documentación es muy similar a la predeterminada, solo se añade: `max_line_length = 100`.

---

## 🧹 Configuración de ESLint

Angular no incluye linter por defecto, pero viene preparado para configurarlo por nosotros en caso necesario.

Ejecuta el siguiente comando de terminal en la raíz del proyecto:

```bash
ng lint
```

La ejecución solicita un par de confirmaciones:

- Would you like to add ESLint now? `Yes`
- Confirming installation

A lo que responderemos que si. (Basta con presionar ENTER, ya que "si" es la respuesta por defecto)

Esto es equivalente a:

- Instala las dependencias.

    ```bash
    pnpm add --save-dev eslint @angular-eslint/builder typescript-eslint @eslint/js angular-eslint
    ```

- Genera el archivo de configuración:

    ```js
    // @ts-check
    const eslint = require("@eslint/js");
    const tseslint = require("typescript-eslint");
    const angular = require("angular-eslint");

    module.exports = tseslint.config(
    {
        files: ["**/*.ts"],
        extends: [
        eslint.configs.recommended,
        ...tseslint.configs.recommended,
        ...tseslint.configs.stylistic,
        ...angular.configs.tsRecommended,
        ],
        processor: angular.processInlineTemplates,
        rules: {
        "@angular-eslint/directive-selector": [
            "error",
            {
            type: "attribute",
            prefix: "app",
            style: "camelCase",
            },
        ],
        "@angular-eslint/component-selector": [
            "error",
            {
            type: "element",
            prefix: "app",
            style: "kebab-case",
            },
        ],
        },
    },
    {
        files: ["**/*.html"],
        extends: [
        ...angular.configs.templateRecommended,
        ...angular.configs.templateAccessibility,
        ],
        rules: {},
    }
    );
    ```

- Añade configuraciones a `angular.json`.
- Y añade el comando: `pnpm run lint` a los script del `package.json`.

---

## 🎨 Configuración de Prettier

Instalar Prettier como dependencias de desarrollo.

```bash
pnpm add --save-dev prettier
```

Crea un archivo `.prettierrc` o `.prettierrc.json` en la raíz del proyecto con el siguiente contenido:

```json
{
  "tabWidth": 2,
  "useTabs": false,
  "singleQuote": true,
  "semi": true,
  "bracketSpacing": true,
  "arrowParens": "avoid",
  "trailingComma": "es5",
  "endOfLine": "lf",
  "printWidth": 100
}
```

> **⚠️ Nota:** Esta configuración ya es compatible con la del fichero `.editorconfig`.

Y un archivo `.prettierignore` para excluir archivos que no deben ser formateados:

> **Nota:** Esto es especialmente necesario para que el archivo: `pnpm-lock.yaml` que es generado por **pnpm** y no debe ser alterado por el desarrollador.

```conf
# Ignorar archivos de lock
pnpm-lock.yaml

# Ignorar dependencias
node_modules
dist
coverage

# Ignorar archivos de entorno
.env
.env.*.local

# Ignorar archivos de configuración del sistema
.DS_Store
Thumbs.db

# Ignorar archivos de salida de Angular
.angular
```

## 🛠️ Integración de Prettier con ESLint

**Prettier** y **ESLint** pueden generar conflictos entre ellos. Para evitarlo se puede utilizar la siguiente configuración:

Instalar los plugin de compatibilidad:

```bash
pnpm add -D eslint-config-prettier eslint-plugin-prettier prettier-eslint
```

Añadir la configuración del plugin al fichero: `eslint.config.js`.

```js
// ...
const eslintPluginPrettierRecommended = require('eslint-plugin-prettier/recommended');

module.exports = tseslint.config(
    {
    // ...
    extends: [
        // ...
        eslintPluginPrettierRecommended,
    ]
    // ...
    }
);
```

El fichero final debería lucir de la siguiente manera:

```js
// @ts-check
const eslint = require('@eslint/js');
const tseslint = require('typescript-eslint');
const angular = require('angular-eslint');
const eslintPluginPrettierRecommended = require('eslint-plugin-prettier/recommended');

module.exports = tseslint.config(
  {
    files: ['**/*.ts'],
    extends: [
      eslint.configs.recommended,
      ...tseslint.configs.recommended,
      ...tseslint.configs.stylistic,
      ...angular.configs.tsRecommended,
      eslintPluginPrettierRecommended,
    ],
    processor: angular.processInlineTemplates,
    rules: {
      '@angular-eslint/directive-selector': [
        'error',
        {
          type: 'attribute',
          prefix: 'app',
          style: 'camelCase',
        },
      ],
      '@angular-eslint/component-selector': [
        'error',
        {
          type: 'element',
          prefix: 'app',
          style: 'kebab-case',
        },
      ],
    },
  },
  {
    files: ['**/*.html'],
    extends: [...angular.configs.templateRecommended, ...angular.configs.templateAccessibility],
    rules: {},
  }
);

```

Podemos añadir la siguiente linea: `"format": "prettier --write ."` a la sección de `scripts` del `package.json`.\
Esto permite ejecutar el siguiente comando de terminal para aplicar el formato configurado a todo el proyecto.

```bash
pnpm run format
```

---

## ⚠️ Manejo de Saltos de Línea (LF vs CRLF)

Si ves advertencias como la siguiente al ejecutar `git add .` u otro comando de git:

```shell
warning: in the working copy of 'src/styles.scss', LF will be replaced by CRLF the next time Git touches it
```

Puedes solucionarlo con:

```bash
git config --global core.autocrlf input
```

Y opcionalmente, fuerza el estilo de fin de línea en Git con un archivo `.gitattributes`:

```conf
* text eol=lf
```

---

## ✅ Recomendaciones Finales

- Usa extensiones de VS Code como **EditorConfig for VS Code**, **Prettier** y **ESLint** para formateo automático.
- Puedes configurar `formatOnSave` en tu editor.
- Ejecuta `ng lint` y `prettier --check .` como parte de tu CI/CD.
