# Curso de Angular Router: Lazy Loading y Programación Modular

## All Modules y Custom Strategy (17/25)
- Cómo hacer precarga de todos los módulos
    Importando PreloadAllModules desde @angular/router, lo pasas como parámetro al import en el decorador @NgModule(). De esta manera, se cargarán en el primer render TODOS los módulos que tu aplicación tenga, pudiendo ver por consola algo como lo siguiente.

```
// app-routing.module.ts
import { NgModule } from '@angular/core';
import { RouterModule, Routes, PreloadAllModules } from '@angular/router';

const routes: Routes = [
  ...
];

@NgModule({
  imports: [RouterModule.forRoot(routes, {
    preloadingStrategy: PreloadAllModules
  })],
  exports: [RouterModule]
})
export class AppRoutingModule { }
```

- Pasos para una estrategia personalizada de precarga
1. Agrega metadata a cada ruta
Agrégale a cada regla en el routing de tu aplicación, metadata para indicarle a cada módulo si debe ser precargado, o no.
Con la propiedad data: { preload: true }, le indicas al servicio CustomPreloadingStrategy si el módulo debe ser precargado en el primer render de tu app.
2. Crea un servicio con estrategia personalizada
Crea un servicio al cual llamaremos CustomPreloadingStrategy con la siguiente lógica.
El servicio implementa PreloadingStrategy y sobreescribiendo el método preload(), hace uso de la metadata para desarrollar tu propia lógica de renderizado de módulos.
3. Importa tu estrategia
Finalmente, importa tu estrategia personalizada en el routing.

-- Pending add route example for commit on platzy angular project