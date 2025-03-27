# Curso de Programación Reactiva con RxJS

## ¿Por qué deberías aprender programación reactiva con RxJS? (1)

- [RxJS](https://rxjs.dev)
- [ReactiveX languages](https://reactivex.io/languages.html)

## Extensiones Reactivas (3)

- [ReactiveX](https://reactivex.io/)
- [The Reactive Manifesto](https://www.reactivemanifesto.org/)
- [ReactiveX - The Observable Contract](https://reactivex.io/documentation/contract.html)

## Diagrama de canicas

[RxJS Marbles: Interactive diagrams of Rx Observables](https://rxmarbles.com/)

## Observables: fromEvent (8)

**Documentation:** [fromEvent](https://rxjs.dev/api/index/function/fromEvent)

Example: Get coordinates (X,Y) from mouse.

```js
import { fromEvent } from "rxjs";

const onMouseMove$ = fromEvent(document, 'mousemove');

const mouseObserver = {

    next: (event) => {
        const { clientX, clientY } = event;
        console.log(`clientX: ${clientX}, clientY: ${clientY}`);
    }
}

onMouseMove$.subscribe(mouseObserver);
```

Example: Get keydown from keyboard.

```js
import { fromEvent } from "rxjs";

const onKeyDown$ = fromEvent(document, 'keydown');

const keyBoardObserver = {

    next: (event) => {
        console.log(event);
    }
}

onKeyDown$.subscribe(keyBoardObserver);
```
