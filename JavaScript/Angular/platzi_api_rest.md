
## Evitando el callback hell (15/23)

### Cómo solucionar el Infierno de Callbacks
Utilizando promesas, puedes resolver este problema fácilmente con async/await. Pero si hablamos de observables, nuestra mejor amiga, la librería RxJS, llega para aportar su solución.

Un ejemplo común de esta problemática en Angular es como la siguiente

readAndUpdate(): void {
  // Ejemplo de callback hell
  this.apiService.getProduct(1)
    .subscribe(res => {
      this.apiService.updateProduct(1, { name: 'Nuevo nombre del producto' })
        .subscribe(res2 => {
          // ...
        });
    });
}

### ¿Callbacks dependientes?
Tal vez hasta dos subscribe es aceptable, pero no se recomienda continuar con esa estructura de código y es posible resolverlo de la siguiente manera.

import { switchMap } from 'rxjs/operators';
readAndUpdate(): void {
  // Solución callback hell
  this.apiService.getProduct(1)
    .pipe(
      switchMap(products => this.apiService.updateProduct(1, { name: 'Nuevo nombre' }) )
    )
    .subscribe(res => {
      // Producto actualizado
    });
}


### ¿Callbacks independientes?
Otra alternativa que brinda RxJS es la posibilidad de manipular varios observables al mismo tiempo. Con las promesas, puedes hacer uso de Promise.all([]) para realizar N procesamientos asincrónicos en paralelo y obtener sus resultados.
De forma muy similar, en RxJS puedes hacer lo siguiente.

import { zip } from 'rxjs';
readAndUpdate(): void {
  // Agrupando observables en un mismo subscribe
  zip(
    this.apiService.getProduct(1),
    this.apiService.updateProductPATCH(1, { name: 'Nuevo nombre' })
  )
  .subscribe(res => {
    const get = res[0];
    const update = res[1];
  });
}