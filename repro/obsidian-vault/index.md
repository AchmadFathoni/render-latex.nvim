---
title: Obsidian Integration Repro
tags:
  - render-latex
  - repro
fake_inline: $frontmatter_should_not_render$
fake_display: $$ frontmatter_should_not_render $$
---

# Obsidian Integration Repro

This note is for testing `obsidian.nvim` plus `render-latex.nvim` together.

Wiki link to [[linked-note]] near inline math $e^{i\pi} + 1 = 0$.

Embedded note syntax should coexist with math: ![[linked-note]].

#render-latex #obsidian

## Display Math

$$
\frac{-b \pm \sqrt{b^2 - 4ac}}{2a}
$$

## Bracket Math

\[
\int_0^\infty e^{-x^2} \, dx = \frac{\sqrt{\pi}}{2}
\]

## Inline Math

Euler identity: $e^{i\pi} + 1 = 0$.

- [ ] Checkbox with inline math $a^2 + b^2 = c^2$.
- [x] Completed checkbox with parenthesized inline math \(\alpha + \beta\).

## Obsidian Callout

> [!NOTE]
> Test that callouts and display math styling coexist.
> $$
> \sum_{n=1}^{\infty} \frac{1}{n^2} = \frac{\pi^2}{6}
> $$

> [!TIP]
> Bracket display math in a callout should render too.
> \[
> \nabla \cdot \vec{E} = \frac{\rho}{\epsilon_0}
> \]

```markdown
$$
this should stay raw inside a fenced code block
$$
```
