# Documentation

Este proyecto es una recopilación de conocimientos a partir de mi experiencia con diversas tecnologías con las que he trabajado y formaciones que he recibido.

## 1️⃣ Placeholder-Based Examples

### 📘 Traducción: *Ejemplos basados en marcadores de posición*

También se les llama:

* **Template-style examples**
* **Parameterised examples**
* **Abstract examples**

### 📌 Qué es (Placeholder-Based Examples)

Ejemplos que usan valores genéricos en lugar de datos reales.

```bash
git log <file-name>
```

```json
{
  "apiKey": "<your-api-key>",
  "environment": "<environment-name>"
}
```

---

### ✅ Ventajas (Placeholder-Based Examples)

* Más reutilizable
* Más claro conceptualmente
* Evita copiar datos sensibles
* Ideal para documentar parámetros o sintaxis
* Reduce riesgo de que el usuario copie valores incorrectos

---

### ❌ Desventajas (Placeholder-Based Examples)

* Menos realista
* Puede generar dudas si el usuario no entiende qué reemplazar
* No muestra contexto completo
* Puede ser ambiguo para perfiles junior

---

### 🧠 Cuándo usarlo

* Documentación de referencia (API reference)
* Especificación de CLI
* Documentación formal
* Cuando explicas sintaxis general

---

## 2️⃣ Real-World Examples

### 📘 Traducción: *Ejemplos realistas* o *Ejemplos del mundo real*

También se llaman:

* **Concrete examples**
* **Realistic examples**
* **Worked examples**
* **Contextual examples**

### 📌 Qué es (Real-World Examples)

Ejemplos completos con datos realistas y contexto real.

```bash
git log src/app/app.component.ts
```

```json
{
  "apiKey": "sk_live_89xj29dk2k",
  "environment": "production"
}
```

---

### ✅ Ventajas (Real-World Examples)

* Más fácil de entender
* Más didáctico
* Reduce ambigüedad
* Más útil para onboarding
* Más cercano a cómo se usa realmente

---

### ❌ Desventajas (Real-World Examples)

* Puede dar falsa sensación de que esos valores deben usarse literalmente
* Puede quedar desactualizado
* Si es demasiado específico, pierde generalidad
* Riesgo de copiar/pegar sin entender

---

## 📊 Comparación directa

| Criterio | Placeholder-Based | Real-World Example |
| ---- | ---- | ---- |
| Claridad conceptual | ⭐⭐⭐⭐ | ⭐⭐⭐ |
| Facilidad para junior | ⭐⭐ | ⭐⭐⭐⭐ |
| Reutilizable | ⭐⭐⭐⭐ | ⭐⭐ |
| Ideal para referencia técnica | ✅ | ⚠️ |
| Ideal para tutorial | ⚠️ | ✅ |

---

## 🏆 ¿Cuál es más recomendado?

👉 **El enfoque profesional moderno recomienda combinar ambos.**

El patrón recomendado en documentación madura (Stripe, AWS, Angular, etc.) es:

### 1️⃣ Mostrar ejemplo real

### 2️⃣ Luego explicar parámetros con placeholders

Ejemplo profesional:

```bash
git log src/app/app.component.ts
```

You can replace `src/app/app.component.ts` with any file path in your repository.

---

## 🎯 Recomendación para tu caso (librería de componentes / documentación técnica)

Como trabajas en:

* Librería de componentes
* Angular
* Documentación tipo Storybook / Confluence

Te recomiendo esta regla:

### 📌 Para documentación de referencia → Placeholder-Based

### 📌 Para guías, onboarding y tutoriales → Real-World Examples

### 📌 Para máxima calidad → Ambos combinados

---

## 🧩 Nombre resumido correcto

| Inglés                    | Español                                |
| ------------------------- | -------------------------------------- |
| Placeholder-Based Example | Ejemplo basado en marcador de posición |
| Real-World Example        | Ejemplo del mundo real                 |
| Concrete Example          | Ejemplo concreto                       |
| Template Example          | Ejemplo tipo plantilla                 |
