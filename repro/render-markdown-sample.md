---
title: render-markdown Integration Repro
fake_inline: $frontmatter_should_not_render$
fake_display: $$ frontmatter_should_not_render $$
---

# render-markdown Integration Repro

This file tests `render-markdown.nvim` and `render-latex.nvim` together.
Expected setup: render-markdown handles Markdown UI, while render-latex owns LaTeX display images and inline fallback.

## Quote

> The display math below should be rendered by `render-latex.nvim`.

$$
\frac{1}{1 + x^2}
$$

## Mixed Markdown

- bullet one
- bullet two with inline math $a^2 + b^2 = c^2$
- [ ] task with parenthesized inline math \(\alpha + \beta\)

| Item | Math |
| --- | --- |
| row | $x \in A$ |

> [!NOTE]
> Callout display math should still render.
> $$
> \sum_{k=1}^{n} k = \frac{n(n + 1)}{2}
> $$

```lua
print("render-markdown code block with raw $math$ and $$display$$")
```

\[
\int_0^\infty e^{-x^2} \, dx = \frac{\sqrt{\pi}}{2}
\]

```markdown
\[
this should stay raw inside a fenced code block
\]
```
