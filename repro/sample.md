# render-latex.nvim Demo

This single fixture drives the dark and light repro sessions used for `demo.png` and `demo-light.png`.
Open it with `repro/repro.lua` for the default theme or `repro/light_theme.lua` for Solarized Light.

Inline math stays editable and cursor-friendly: $E = mc^2$, $x^2 + y^2 = r^2$, $\alpha + \beta$, and \(\nabla \cdot E = \rho / \epsilon_0\).

## Display Math

Transparent display equations inherit the current text color, which keeps the same Markdown readable in dark and light themes.

$$
\frac{-b \pm \sqrt{b^2 - 4ac}}{2a}
$$

\[
\int_0^\infty e^{-x^2}\,dx = \frac{\sqrt{\pi}}{2}
\]

## Aligned Derivation

\[
\begin{aligned}
\nabla \cdot \mathbf{E} &= \frac{\rho}{\epsilon_0} \\
\nabla \cdot \mathbf{B} &= 0 \\
\nabla \times \mathbf{E} &= -\frac{\partial \mathbf{B}}{\partial t} \\
\nabla \times \mathbf{B} &= \mu_0\mathbf{J} + \mu_0\epsilon_0\frac{\partial \mathbf{E}}{\partial t}
\end{aligned}
\]

## Linear Algebra

$$
\begin{bmatrix}
2 & -1 & 0 \\
-1 & 2 & -1 \\
0 & -1 & 2
\end{bmatrix}
\begin{bmatrix}
x_1 \\
x_2 \\
x_3
\end{bmatrix}
=
\begin{bmatrix}
1 \\
0 \\
1
\end{bmatrix}
$$

## Piecewise Function

$$
f(x) =
\begin{cases}
x^2, & x \ge 0 \\
-x, & x < 0
\end{cases}
$$

## Chemistry

$$
\ce{H2SO4 + 2NaOH -> Na2SO4 + 2H2O}
$$

## Quotes And Callouts

> Math inside quotes uses quote-aware foreground colors:
>
> $$
> \sum_{n=1}^{\infty} \frac{1}{n^2} = \frac{\pi^2}{6}
> $$

> [!NOTE]
> Display math also works inside Markdown callouts:
>
> $$
> e^{i\pi} + 1 = 0
> $$

## Ignored Markdown

Inline code should stay raw: `$\sqrt{x}$`.

```markdown
$$
this_should_not_render_inside_a_code_fence
$$
```

    $$
    this_indented_block_should_not_render
    $$

## Repro Notes

Use `<leader>lr` to refresh, `<leader>lt` to toggle rendering, and `<leader>ls` to inspect status.
If images do not appear in tmux, quit and run the same repro directly in your terminal first.
