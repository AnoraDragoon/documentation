# Notes

Crear un dato tipo diccionario (Map) en typescript

```ts
let map: {[key:string] : string} = null;
```

Transforma un objeto con keys en (snake case) en otro igual pero con keys en (camel case)

```ts
function snakeToCamel(obj: any): any {
  if (typeof obj !== "object" || obj === null) {
    return obj
  }

  if (Array.isArray(obj)) {
    return obj.map(snakeToCamel)
  }

  return Object.keys(obj).reduce((acc, key) => {
    const camelKey = key.replace(/_([a-z])/g, (_, letter) => letter.toUpperCase())
    acc[camelKey] = snakeToCamel(obj[key])
    return acc
  }, {} as any)
}
```
