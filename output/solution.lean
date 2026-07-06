import Mathlib

/-
# Problem Description

All quantities below are complex numbers, except `y` which is a positive real
number. They abstract the values, at a fixed point `tau` in the upper
half-plane, of the functions appearing in Ono's paper *The partition function
and elliptic curves* and its companion spec. Only the values enter the two
identities, so we take them as given data.

## Ground data

Fix a real number `y > 0` (to be read as `y = Im tau`) and complex numbers
`E_2, E_4, E_6, F, DF, J`, and `Phi_Y, Phi_XX, Phi_XY, Phi_YY`, subject to the
constraints `E_4 != 0`, `J != 1728`, and `Phi_Y != 0`. Here `DF` denotes the
value of `(1/(2 pi i)) F'`, and `Phi_Y, Phi_XX, Phi_XY, Phi_YY` denote the
values, at the diagonal point `(J, J)`, of the corresponding first and second
partial derivatives of the modular polynomial.

## Main Definitions

1. (Nonholomorphic completion)  `E_2^* := E_2 - 3 / (pi * y)`.
2. (Weight-`k` operators)  for `k` in `ZZ`:
     `partial_k F := DF - (k / (4 pi y)) F`,
     `theta_k F   := DF - (k / 12) E_2 F`.
3. (Weak Maass value)  `P := - partial_{-2} F`.
4. (Diagonal CM tangent)  `tau_CM(J) := (Phi_YY - Phi_XY) / Phi_Y`.

## Main Statements

Key Formula 1:  `P = - theta_{-2} F + (1/6) E_2^* F`.

Key Formula 2:  If `Phi_XX = Phi_YY`, then
  `((1/2) Phi_XX - Phi_XY + (1/2) Phi_YY) / Phi_Y = tau_CM(J)`.

Both statements are equalities of complex numbers that follow by elementary
algebra from the definitions.
-/

section KeyFormulas

-- Ground data: `y = Im tau` a positive real, and the complex values.
variable (y : ℝ) (hy : 0 < y)
variable (E2 E4 E6 F DF J : ℂ)
variable (ΦY ΦXX ΦXY ΦYY : ℂ)

-- Main Definition(s)

/-- Nonholomorphic completion of `E_2`: `E_2^* = E_2 - 3 / (pi * y)`. -/
noncomputable def E2star : ℂ := E2 - 3 / (Real.pi * y)

/-- Weight-`k` raising-type operator: `partial_k F = DF - (k / (4 pi y)) * F`. -/
noncomputable def partialOp (k : ℤ) : ℂ := DF - ((k : ℂ) / (4 * Real.pi * y)) * F

/-- Weight-`k` Serre-type operator: `theta_k F = DF - (k / 12) * E_2 * F`. -/
noncomputable def thetaOp (k : ℤ) : ℂ := DF - ((k : ℂ) / 12) * E2 * F

/-- Weak Maass value: `P = - partial_{-2} F`. -/
noncomputable def P : ℂ := - partialOp y F DF (-2)

/-- Diagonal CM tangent: `tau_CM(J) = (Phi_YY - Phi_XY) / Phi_Y`. -/
noncomputable def tauCM : ℂ := (ΦYY - ΦXY) / ΦY

-- Main Statement(s)

/-- **Key Formula 1.** `P = - theta_{-2} F + (1/6) * E_2^* * F`. -/
theorem key_formula_one :
    P y F DF = - thetaOp E2 F DF (-2) + (1 / 6) * E2star y E2 * F := by
  unfold P partialOp thetaOp E2star
  push_cast
  rcases eq_or_ne (y : ℂ) 0 with hyc | hyc
  · rw [hyc]; simp; ring
  · have hpi : (Real.pi : ℂ) ≠ 0 := by
      exact_mod_cast Real.pi_ne_zero
    field_simp
    ring

/-- **Key Formula 2.** If `Phi_XX = Phi_YY`, then
`((1/2) Phi_XX - Phi_XY + (1/2) Phi_YY) / Phi_Y = tau_CM(J)`. -/
theorem key_formula_two (hΦY : ΦY ≠ 0) (h : ΦXX = ΦYY) :
    ((1 / 2) * ΦXX - ΦXY + (1 / 2) * ΦYY) / ΦY = tauCM ΦY ΦXY ΦYY := by
  unfold tauCM
  subst h
  ring

end KeyFormulas
