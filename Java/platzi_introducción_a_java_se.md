# Curso de Introducción a Java SE

## La JShell de JavaClase (9 / 39)

JShell is an interactive Java shell tool introduced in Java 9. It provides a command-line interface for running Java code snippets and evaluating expressions interactively, without needing to write a full Java class or compile a complete Java program. JShell is particularly useful for quickly testing small code snippets, experimenting with Java syntax, and learning Java concepts.

Key features of JShell include:

1. **Interactive Evaluation**: You can type Java expressions, statements, and declarations directly into the JShell prompt, and it will evaluate them on the fly.

2. **Immediate Feedback**: JShell provides immediate feedback on the results of the evaluated expressions or statements, making it easy to test code incrementally.

3. **Tab Completion**: It supports tab completion for class names, method names, variables, and more, which helps in writing code faster and with fewer errors.

4. **History Support**: JShell maintains a history of previously executed commands, allowing you to recall and reuse them easily.

5. **Documentation and Help**: You can access documentation and help information directly from the JShell prompt using special commands.

Overall, JShell is a valuable tool for Java developers, educators, and learners alike, as it provides a lightweight, interactive environment for experimenting with Java code.

To open JShell type `jshell` on Terminal.

```sh
jshell
```

Inside JShell there are some options:

- `/help` to show JShell help.
- `/ex` to go out from JShell.

## Técnica de Naming: Camel Case (13 / 39)

Camel Case es una convención muy popular para nombrar nuestras variables. Podemos usarlo en modo Upper Camel Case o Lower Camel Case, la diferencia es si comenzamos el nombre de la variable con mayúscula o minúscula.

```Java
// Upper Camel Case:
class SoyUnaClase {};

// Lower Camel Case
int soyUnNumeroInt = 10;
```

Debemos usar Upper Camel Case en los nombres de las clases y archivos. Y Lower Camel Case en los nombres de las variables o métodos.
