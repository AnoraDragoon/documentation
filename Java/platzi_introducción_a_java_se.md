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
class SoyUnaClase {} |;

// Lower Camel Case
int soyUnNumeroInt = 10;
```

Debemos usar Upper Camel Case en los nombres de las clases y archivos. Y Lower Camel Case en los nombres de las variables o métodos.

## Java Docs (28 / 39)

Los Java Docs son una herramienta usada por muchas otras herramientas y aplicaciones porque nos ayuda a documentar todo nuestro código usando comentarios. Además, nos permite visualizar la documentación en formato HTML.

Tipos de comentarios

```Java
// Comentarios de una sola línea

/* Comentario
en múltiples
líneas */

/**
 * Comentario para Java Docs
 */
```

## Javadoc en funciones (29 / 39)

JavaDoc Example:

```java
/**
 * Description: Function to convert specific currency quantity to dollar.
 *
 * @param quantity Money quantity to convert to dollars.
 * @param currency Currency type: ("MXN", "COP")
 * @return double Money quantity in dollars.
 */
double convertToDollar(double quantity, String currency) {
    switch (currency) {
        case "MXN":
            quantity *= 0.052;
            break;
        case "COP":
            quantity *= 0.00031;
            break;
    }
    return quantity;
}
```

Para que el IDE muestre la descripción y documentación de las funciones debemos entrar a IntelliJ IDEA > Preferences > Editor > General > Code Complettion y habilitar la opción de Show the documentarion popup.

## Tags Java Docs (30 / 39)

| Tag            | Description                                                                                                                  | Syntax                                 |
|----------------|------------------------------------------------------------------------------------------------------------------------------|----------------------------------------|
| @author        | Adds the author of a class.                                                                                                   | @author name-text                      |
| {@code}        | Displays text in code font without interpreting the text as HTML markup or nested javadoc tags.                               | {@code text}                           |
| {@docRoot}     | Represents the relative path to the generated document's root directory from any generated page.                              | {@docRoot}                             |
| @deprecated    | Adds a comment indicating that this API should no longer be used.                                                             | @deprecated deprecatedtext             |
| @exception     | Adds a **Throws** subheading to the generated documentation, with the classname and description text.                         | @exception class-name description      |
| {@inheritDoc}  | Inherits a comment from the **nearest** inheritable class or implementable interface.                                         | Inherits a comment from the immediate superclass. |
| {@link}        | Inserts an in-line link with the visible text label that points to the documentation for the specified package, class, or member name of a referenced class. | {@link package.class#member label} |
| {@linkplain}   | Identical to {@link}, except the link's label is displayed in plain text than code font.                                      | {@linkplain package.class#member label}|
| @param         | Adds a parameter with the specified parameter-name followed by the specified description to the "Parameters" section.         | @param parameter-name description      |
| @return        | Adds a "Returns" section with the description text.                                                                           | @return description                    |
| @see           | Adds a "See Also" heading with a link or text entry that points to reference.                                                 | @see reference                         |
| @serial        | Used in the doc comment for a default serializable field.                                                                     | @serial field-description \| include \| exclude |
| @serialData    | Documents the data written by the writeObject( ) or writeExternal( ) methods.                                                 | @serialData data-description           |
| @serialField   | Documents an ObjectStreamField component.                                                                                     | @serialField field-name field-type field-description |
| @since         | Adds a "Since" heading with the specified since-text to the generated documentation.                                          | @since release                         |
| @throws        | The @throws and @exception tags are synonyms.                                                                                 | @throws class-name description         |
| {@value}       | When {@value} is used in the doc comment of a static field, it displays the value of that constant.                           | {@value package.class#field}           |
| @version       | Adds a "Version" subheading with the specified version-text to the generated docs when the -version option is used.           | @version version-text                  |
