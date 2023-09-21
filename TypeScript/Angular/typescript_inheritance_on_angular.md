# TypeScript Inheritance on Angular
Bibligrafía: https://www.typescriptlang.org/docs/handbook/2/classes.html
## Interface Inheritance
There are several way to apply interface inheritance on TypeScript

## Class Inheritance
Para extender una clase se utiliza la palabra recerbada "extends", la herencia se declara
directamente despues del nombre de la clase y antes de las implementaciones. Solo es
posible heredar de una clase padre.
Es obligatorio llamar el constructor de la clase padre en el constructor de nuestra clase.
Los attributos y funciones que se deseen heredar deben ser de visibilidad protected o publc, nunca private.

```
import { SimpleParent } from 'src/app/parent';

export class SimpleChild extends SimpleParent {

    constructor() {
        super();
    }
}
```

### OPP Principles
Here, there is a documentation about SOLID principles. It could be good check it mainly Open-close principle, because this article is based on it.

## Services Inheritance
Extend an Angular service is so similar to extend another kind of class in TypeScript. The most important to take account is the dependency injection applied on service constructor must not be private. Neither in the father nor in the son.
It is possible to use inheritance on dependecy injection, that allow polymorphic substitutions.

## Components Inheritance


## Pipes Inheritance


## Guards Inheritance


## Modules Inheritance


## Index routing

To create an index.ts file that exports all parent classes that can be extended or imported from the child module. This is not necessary, but abstracts to child classes of parent location.

```
export { SingleParentService } from './services/single-parent.service';
export * from './shared';
```


Los page components no ejecutan funciones heredadas del ciclo de vida del componente.

Los componentes incluidos dentro de otros si lo hacen.