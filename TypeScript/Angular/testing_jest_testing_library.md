# Angular testing con Jest y Testing Library

Documentation:

[Configura Jest y Angular Testing Library: Moderniza las pruebas en tu proyecto Angular](https://medium.com/@angelcruzl/configura-jest-y-angular-testing-library-moderniza-las-pruebas-en-tu-proyecto-angular-ca2b9db97f84)

---

## 📝 Resumen

Razones por las cuales migrar las pruebas unitarias en un proyecto Angular

- **Jest** ofrece mayor velocidad y simplicidad en la configuración.
- **Angular Testing Library (ATL)** promueve pruebas centradas en el usuario, más intuitivas y mantenibles.
- **Karma** ha sido descontinuado (actualmente es un proyecto muerto).

### Pasos clave

1. **Eliminar Karma y Jasmine** del proyecto.
2. **Instalar y configurar Jest**, incluyendo `jest.config.ts` y `setup-jest.ts`.
3. **Actualizar `tsconfig.spec.json`** para usar Jest.
4. **Modificar scripts de prueba** en `package.json`.
5. **Instalar y configurar Angular Testing Library** para pruebas orientadas al usuario.

---

## 📚 Documentación Técnica: Migración a Jest y Angular Testing Library

### 1. **Eliminar Karma y Jasmine**

```bash
pnpm remove karma karma-chrome-launcher karma-coverage karma-jasmine karma-jasmine-html-reporter @types/jasmine jasmine-core
```

Eliminar la sección `"test"` de `angular.json` y el archivo `karma.conf.js` si existe.

---

### 2. **Instalar dependencias de Jest**

```bash
pnpm install -D jest @types/jest jest-preset-angular ts-node
```

Crear `setup-jest.ts` en la raíz del proyecto:

```ts
import { setupZoneTestEnv } from 'jest-preset-angular/setup-env/zone';

setupZoneTestEnv();
```

> **⚠️ Nota:** En el momento en que Angualar se migre a **zoneless**
> es necesario cambiar esta configuración por:

```ts
import { setupZonelessTestEnv } from 'jest-preset-angular/setup-env/zoneless';

setupZonelessTestEnv();
```

---

### 3. **Configurar Jest**

Crear `jest.config.ts`:

```ts
import type { Config } from 'jest';

const config: Config = {
  preset: 'jest-preset-angular',
  setupFilesAfterEnv: ['<rootDir>/setup-jest.ts'],
  moduleDirectories: ['node_modules', '<rootDir>'],
  testMatch: ['**/+(*.)+(spec).+(ts)'],
};

export default config;
```

Actualizar `tsconfig.spec.json`:

```json
{
  "extends": "./tsconfig.json",
  "compilerOptions": {
    "esModuleInterop": true,
    "outDir": "./out-tsc/spec",
    "types": ["jest"]
  },
  "include": [
    "src/**/*.spec.ts",
    "src/**/*.d.ts",
    "./setup-jest.ts"
  ]
}
```

---

### 4. **Actualizar scripts en `package.json`**

```json
"scripts": {
  "test": "jest",
  "test:coverage": "jest --coverage"
}
```

---

### 5. **Instalar Angular Testing Library**

```bash
pnpm i -D @testing-library/dom @testing-library/jest-dom @testing-library/angular @testing-library/user-event
```

alternativamente:

```bash
ng add @testing-library/angular
```

Esta variante hará 2 preguntas a las que se responderá que si.

- ✔ Would you like to install jest-dom? Yes
- ✔ Would you like to install user-event? Yes

Actualizar `setup-jest.ts`:

```ts
import { setupZoneTestEnv } from 'jest-preset-angular/setup-env/zone';
import '@testing-library/jest-dom';

setupZoneTestEnv();
```

---

### 6. **Ejemplo de prueba con ATL**

```ts
import { render, screen } from '@testing-library/angular';
import { AppComponent } from './app.component';

describe('AppComponent', () => {
  it('should render the title', async () => {
    await render(AppComponent, {
      componentProperties: { title: 'Test Title' },
    });

    const title = screen.getByRole('heading', { name: 'Hello, Test Title' });
    expect(title).toBeTruthy();
  });
});
```

HTML necesario:

```html
<h1>Hello, {{ title }}</h1>
```

---

## ✅ **Beneficios**

- **Jest**: rápido, simple, ideal para pruebas unitarias.
- **ATL**: pruebas más realistas, centradas en el usuario.

---

¿Te gustaría que genere esta documentación como archivo descargable (por ejemplo, en formato Markdown o PDF)?
