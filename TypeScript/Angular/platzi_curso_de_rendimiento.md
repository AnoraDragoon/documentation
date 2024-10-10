# Curso de Rendimiento en Angular

## ¿Qué es un bundle size? Tree shaking y su importancia (2/23)

- Bundle Size: Cuánto pesa en bytes.
- Lazy loading: Técnica que modulariza la aplicación.

JS realiza 4 pasos par ala carga de la app:
\
Descargar: este paso es el toma más tiempo.
\
Parsear
\
Compilarlo
\
Renderizarlo

tree shaking
\
Una técnica en la cual removemos las librerías y código que no se utiliza en la app.

## Implementando Webpack Bundle Analyzer (3/23)

Webpack bundle analyzer: permite analizar los paquetes que utilizamos en nuestro proyecto
It is a dev dependency.

- Install: Webpack bundle analyzer

```
npm install webpack-bundle-analyzer --save-dev
```

- Compilar con la bandera "--stats-json" para generar un archivo de estadisticas

```
ng build --prod --stats-json
```

- Ubicación del archivo de reporte.
dist/my-project/stats-es2015.json
- Correr el analizis en base al archivo generado

```
npx webpack-bundle-analyzer <file_dir>
```

Ejemplo:

```
npx webpack-bundle-analyzer dist/my-project/stats-es2015.json
```

##  Aplicando un Performance Budget desde el Angular CLI (5/23)

Herramienta que permite estimar el rendimiento de nuestra aplicación.
<https://perf-budget-calculator.firebaseapp.com/>

- Es posible agregar el comando para generar el reporte de rendimiento y correrlo en la seción de scripts de:
/// package.json

```
"analyze": "ng build --prod --stats-json && npx webpack-bundle-analyzer dist/platzi-store/stats-es2015.json"
```

## Implementando GuessJs (11/23)

- Lecturas recomendadas
<https://github.com/guess-js/guess>

## Precarga con Service workers (12/23)

To emprove your web performance you can use service worker.
At its simplest, a service worker is a script that runs in the web browser and manages caching for an application. This reduce app loading time and improve user experience. A reliable Progressive Web App feels fast and dependable regardless of the network.

- Lecturas recomendadas
<https://angular.io/guide/service-worker-getting-started>

- Adding a service worker to your project

```
ng add @angular/pwa --project <project-name>
```

To use PWA make a project build and run your building on a server.

- Install http server:

```
npm install http-server -g
```

- Run building:

```
http-server /dist/<project-dir>
```

## ¿Qué es Server Side Render? (13/23)

- Documentation: <https://angular.io/guide/universal>

## Implementando Angular Universal (14/23)

- Run the following command to add SSR support into your application:

```
ng add @nguniversal/express-engine
```

The command updates the application code to enable SSR and adds extra files to the project structure

- Builds both the server script and the application in production mode. Use this command when you want to build the project for deployment.

```
ng build && ng run app-name:server
```

- Similar to ng serve, which offers live reload during development, but uses server-side rendering

```
npm run dev:ssr
```

## Cuidados con SSR y Angular (15/23)

### Documentation

- Angular Universal (github repo)
<https://github.com/angular/universal#angular-universal>

- Important Considerations when Using Angular Universal
<https://git.sicpa.com/projects/TTMA/repos/tt082-wa-material/pull-requests/285/overview>

## Optimización de componentes con OnPush (19/23)

La estrategia por defecto de Detección de cambios en Angular empieza enla cima con los componentes en la raíz (AppComponent) y refesca los cambios a través de todo el árbol de componentes, recargando cada componente incluso si éste no ha cambiado.

```
@Component({
    ...
    changeDetection:ChangeDetectionStrategy.OnPush
    // changeDetection:ChangeDetectionStrategy.Default
})
```

La estrategía OnPush permite hacer la recarga solo en la rama afectada por el cambio. Lo cual evita recargas inecesarias y por consiguiente ejecuciones de metodos. Mejorarndo el rendimiento de nuestra aplicación.

- "ChangeDetectionStrategy.Default" es la estrategia por defecto y se implementa si no se define ninguna.

## Subscribe (21/23)

Las subscribciones con HttpClient no necesitan hacer unsubscribe, puesto que HttpClient finaliza la subscribcion una ves completada la petición.
Pero otras subscribciones si es necesario finalizarlas una vez dejen de ser necesarias.
