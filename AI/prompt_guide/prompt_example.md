# Prompt example

## Goal
Refactor the Adquira theme mixin to support dark mode.

## Context
File: adquira-theme.scss
Current code:
```scss
html {
  @include adquira-theme.adquira-theme();
}
```

## Requirements
- Add a `$dark-mode: boolean` parameter to the mixin
- Keep backward compatibility (default false)

## Constraints
- Must follow Angular Material theming conventions
- No breaking changes to existing components

## Expected Output
Updated SCSS code block, with explanation of changes.