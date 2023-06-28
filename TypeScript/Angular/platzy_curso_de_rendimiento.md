# Curso de Rendimiento en Angular

## ¿Qué es un bundle size? Tree shaking y su importancia (2/23)
- Bundle Size: Cuánto pesa en bytes.
- Lazy loading: Técnica que modulariza la aplicación.

JS realiza 4 pasos par ala carga de la app:
    Descargar: este paso es el toma más tiempo.
    Parsear
    Compilarlo
    Renderizarlo

tree shaking
    Una técnica en la cual removemos las librerías y código que no se utiliza en la app.

## Implementando Webpack Bundle Analyzer (3/23)
Webpack bundle analyzer: permite analizar los paquetes que utilizamos en nuestro proyecto
It is a dev dependency.

- Install: Webpack bundle analyzer
```
$ npm install webpack-bundle-analyzer --save-dev
```
- Compilar con la bandera "--stats-json" para generar un archivo de estadisticas
```
$ ng build --prod --stats-json
```
- Ubicación del archivo de reporte.
dist/my-project/stats-es2015.json
- Correr el analizis en base al archivo generado
```
$ npx webpack-bundle-analyzer <file_dir>
```
Ejemplo:
```
$ npx webpack-bundle-analyzer dist/my-project/stats-es2015.json
```