# Curso de Angular Forms: Creación y Optimización de Formularios Web

## Integración y validaciones con CSS para mostrar erroresClase (11 / 37)

```html
<p>
  <label for="name-field">Name:</label>
  <input
    type="text"
    id="name-field"
    [class.is-valid]="nameField.touched && nameField.valid"
    [class.is-invalid]="nameField.touched && nameField.invalid"
    [formControl]="nameField"
  />
  <button [disabled]="nameField.invalid" (click)="getNameValue()">
    Get value
  </button>
</p>
<div class="message" [class.active]="nameField.touched && nameField.invalid">
  <strong *ngIf="nameField.touched && nameField.hasError('required')">
    Este campo es requerido
  </strong>
</div>
```

## Usando componentes de Angular MaterialClase (16/37)

> **Note:** To use ``MatDatepickerModule`` with ``MatNativeDateModule``, check Datepicker documentation.
