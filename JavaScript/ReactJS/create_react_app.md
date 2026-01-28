# Create React App

## Using Vite

Vite is a modern build tool that provides a faster and leaner development experience for modern web projects. Here are three ways to create a React app using Vite:

- Documetation: [https://vite.dev/guide/]

---

## 1. Manual Setup with Entry Point

This approach gives you full control over your project structure.

### Steps - Manual Setup

- **1. Create a new Vite project:**

```bash
npm create vite@latest my-react-app
```

- **2. Select "Vanilla" from the framework options**

- **3. Install React dependencies:**

```bash
cd my-react-app
npm install react react-dom
```

- **4. Install the React plugin:**

```bash
npm install -D @vitejs/plugin-react
```

**5. Update or create `vite.config.js`:**

```js
import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'

export default defineConfig({
  plugins: [react()],
})
```

- **6. Create the entry point structure:**

Create `src/main.jsx`:

```jsx
import { StrictMode } from "react";
import { createRoot } from "react-dom/client";
import App from "./app/App";
import "./style.css";

createRoot(document.getElementById("app")).render(
  <StrictMode>
    <App />
  </StrictMode>
);
```

Create `src/App.jsx`:

```jsx
import { useState } from 'react'

function App() {
  const [count, setCount] = useState(0)

  return (
    <div className="App">
      <h1>My React App</h1>
      <button onClick={() => setCount((count) => count + 1)}>
        Count is: {count}
      </button>
    </div>
  )
}

export default App
```

- **7. Start the development server:**

```bash
npm run dev
```

---

## 2. Using React Template from Vite

This is the quickest way to get started with React and Vite.

### Steps - React Template

**1. Create project with React template:**

```bash
npm create vite@latest my-react-app -- --template react
```

**2. Navigate to the project directory:**

```bash
cd my-react-app
```

**3. Install dependencies:**

```bash
npm install
```

**4. Start the development server:**

```bash
npm run dev
```

### What's Included

- Pre-configured React setup
- Hot Module Replacement (HMR)
- ESLint configuration
- Basic component structure
- Optimized build configuration

---

## 3. Using TypeScript Template

For projects that require type safety and better IDE support.

### Steps - TypeScript

**1. Create project with React TypeScript template:**

```bash
npm create vite@latest my-react-app -- --template react-ts
```

**2. Navigate to the project directory:**

```bash
cd my-react-app
```

**3. Install dependencies:**

```bash
npm install
```

**4. Start the development server:**

```bash
npm run dev
```

### TypeScript Configuration

The template includes `tsconfig.json` with recommended settings:

```json
{
  "compilerOptions": {
    "target": "ES2020",
    "useDefineForClassFields": true,
    "lib": ["ES2020", "DOM", "DOM.Iterable"],
    "module": "ESNext",
    "skipLibCheck": true,
    "moduleResolution": "bundler",
    "allowImportingTsExtensions": true,
    "resolveJsonModule": true,
    "isolatedModules": true,
    "noEmit": true,
    "jsx": "react-jsx",
    "strict": true,
    "noUnusedLocals": true,
    "noUnusedParameters": true,
    "noFallthroughCasesInSwitch": true
  },
  "include": ["src"],
  "references": [{ "path": "./tsconfig.node.json" }]
}
```

### Example TypeScript Component

`src/App.tsx`:

```tsx
import { useState } from 'react'

interface CounterProps {
  initialCount?: number
}

function App({ initialCount = 0 }: CounterProps) {
  const [count, setCount] = useState<number>(initialCount)

  return (
    <div className="App">
      <h1>My React TypeScript App</h1>
      <button onClick={() => setCount(count + 1)}>
        Count is: {count}
      </button>
    </div>
  )
}

export default App
```

---

## Comparison Table

| Feature | Manual Setup | React Template | TypeScript Template |
| ------- | ------------ | -------------- | ------------------- |
| Setup Time | Longer | Fast | Fast |
| Control | Full | Standard | Standard |
| Type Safety | Optional | No | Yes |
| Best For | Custom configs | Quick start | Type-safe projects |
| Learning Curve | Higher | Lower | Medium |

---

## Additional Commands

After creating your app, you can use these commands:

```bash
npm run dev      # Start development server
npm run build    # Build for production
npm run preview  # Preview production build
npm run lint     # Run ESLint (if configured)
```

---

## Why Choose Vite Over Create React App?

- ⚡ **Faster startup**: Uses native ES modules
- 🔥 **Hot Module Replacement**: Instant updates
- 📦 **Optimized builds**: Uses Rollup for production
- 🛠️ **Better DX**: Simpler configuration
- 🚀 **Modern**: Built for the modern web
