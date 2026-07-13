[![Logo for Axiom Math](logo.svg)](https://axiommath.ai/)

# Partition Elliptic

This repository contains Lean files for the formalisation of the two **Key Formulas** from
the companion spec `KeyFormulasSpec.tex` to Ken Ono's paper *The partition function and
elliptic curves* (`Ono_PofN.tex`).

Working with the values, at a fixed point $\tau$ of the upper half-plane, of the relevant
modular objects — the quasimodular $E_2$ and its nonholomorphic completion
$E_2^{*} = E_2 - \tfrac{3}{\pi y}$ (with $y = \mathrm{Im}\tau > 0$), the weight-$k$
operators $\partial_k F = DF - \tfrac{k}{4\pi y}F$ and $\vartheta_k F = DF - \tfrac{k}{12}E_2 F$,
the weak Maass value $P = -\partial_{-2}F$, and the diagonal CM tangent
$\tau_{\mathrm{CM}}(J) = \tfrac{\Phi_{YY} - \Phi_{XY}}{\Phi_Y}$ — the formalised statements are:

1. **`key_formula_one`** — $P = -\vartheta_{-2}F + \tfrac{1}{6}E_2^{*}F$.
2. **`key_formula_two`** — If $\Phi_{XX} = \Phi_{YY}$ (and $\Phi_Y \neq 0$), then
   $\dfrac{\tfrac12\Phi_{XX} - \Phi_{XY} + \tfrac12\Phi_{YY}}{\Phi_Y} = \tau_{\mathrm{CM}}(J)$.

Both are equalities of complex numbers that follow by elementary field arithmetic from the
definitions; they are singled out for formal verification precisely because they are where a
sign, constant, or normalization error could enter unnoticed.

The proofs were produced by [AxiomProver](https://axiommath.ai/) and are fully sorry-free.
They were developed and verified using **Lean 4.28.0**. Compatibility with earlier or later
versions is not guaranteed due to the evolving nature of the Lean 4 compiler and its core
libraries.

## Files

### Input Files

- [`input/KeyFormulasSpec.tex`](input/KeyFormulasSpec.tex),
  [`input/Ono_PofN.tex`](input/Ono_PofN.tex), and [`input/task.md`](input/task.md) contain the
  informal source and the task given to AxiomProver.

### Output Files

- [`output/problem.lean`](output/problem.lean) is the formal problem statement.
- [`output/solution.lean`](output/solution.lean) is the formal solution.

## License

This repository uses the MIT License. See [LICENSE](LICENSE) for details.

## Repository maintainers

- [Evan Chen](https://github.com/vEnhance)
- [Ken Ono](https://github.com/kenono691)
