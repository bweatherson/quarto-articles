import ArrheniusSix.Dist
/-
  Thomas's reconstruction (2016) of Arrhenius's fourth theorem and of the corrected sixth
  theorem (Theorem 6*), machine-checked.  Conditions are stated for an arbitrary
  quasi-order R on finite welfare distributions, in Thomas's forms: A is the fixed
  "very high" level (A ≥ 4), levels 1, 2, 3 are "very low positive", Z < 0 is the
  "very negative" level of Weak Non-Sadism.
-/
namespace Arrhenius
open Dist

/-- decide an identity between distributions built from `+` and `single` pointwise -/
macro "dist_ext" : tactic => `(tactic| (funext w; simp only [Dist.add_apply, Dist.single_apply, Nat.mul_add, Nat.add_mul, Nat.mul_one, Nat.one_mul]; first | omega | (split <;> first | omega | (split <;> first | omega | (split <;> first | omega | (split <;> omega))))))

/-- a quasi-order on distributions -/
structure Axiology where
  R : Dist → Dist → Prop
  refl : ∀ P, R P P
  trans : ∀ P Q S, R P Q → R Q S → R P S

namespace Axiology
variable (V : Axiology)

/-- strict betterness -/
def str (P Q : Dist) : Prop := V.R P Q ∧ ¬ V.R Q P

/-- (ED) Egalitarian Dominance: for x < y and n ≥ 1, n·x ≺ n·y. -/
def ED : Prop := ∀ x y : Int, x < y → ∀ n : Nat, 0 < n → V.str (single n y) (single n x)

/-- (GNEP) General Non-Extreme Priority (Thomas's form): for any z there is G such that
for any x ≥ A, any y ∈ {1,2,3} and any finite P,  P + 1·z + G·y ≼ P + 1·(z−1) + G·x. -/
def GNEP (A : Int) : Prop := ∀ z : Int, ∃ G : Nat, 0 < G ∧
  ∀ x : Int, A ≤ x → ∀ y : Int, 0 < y → y ≤ 3 → ∀ P : Dist, finite P →
    V.R (P + single 1 (z - 1) + single G x) (P + single 1 z + single G y)

/-- (NE) Non-Elitism (Thomas's form, restricted background): for x > z + 1 there is G
such that for any finite Rb with levels in [z, x],  Rb + 1·x + G·z ≼ Rb + (G+1)·(x−1). -/
def NE : Prop := ∀ x z : Int, z + 1 < x → ∃ G : Nat, 0 < G ∧
  ∀ Rb : Dist, finite Rb → within Rb z x →
    V.R (Rb + single (G + 1) (x - 1)) (Rb + single 1 x + single G z)

/-- (WNS) Weak Non-Sadism: there is D (possibly 0, as Arrhenius's "a number of lives" allows)
such that for any x > 0, any m and any finite P,  P + D·Z ≼ P + m·x. -/
def WNS (Z : Int) : Prop := ∃ D : Nat,
  ∀ x : Int, 0 < x → ∀ m : Nat, ∀ P : Dist, finite P → V.R (P + single m x) (P + single D Z)

/-- (RA) Repugnant Addition: for some finite P and any n ≥ 1 there is N with
P + n·A ≺ P + N·3. -/
def RA (A : Int) : Prop := ∃ P : Dist, finite P ∧ ∀ n : Nat, 0 < n → ∃ N : Nat,
  V.str (P + single N 3) (P + single n A)

/-- (VRA*) Very Repugnant Addition* (Thomas 2016): for any z < 0 and m ≥ 1 there is a
finite P such that for any n ≥ 1 there is N with  P + m·z + N·3 ≻ P + n·A. -/
def VRAstar (A : Int) : Prop := ∀ z : Int, z < 0 → ∀ m : Nat, 0 < m → ∃ P : Dist, finite P ∧
  ∀ n : Nat, 0 < n → ∃ N : Nat, V.str (P + single m z + single N 3) (P + single n A)

/-- (VRA) Very Repugnant Addition (Arrhenius's intended conclusion): for some finite P,
any z < 0, m ≥ 1, n ≥ 1 there is N with  P + m·z + N·3 ≻ P + n·A. -/
def VRA (A : Int) : Prop := ∃ P : Dist, finite P ∧ ∀ z : Int, z < 0 → ∀ m : Nat, 0 < m →
  ∀ n : Nat, 0 < n → ∃ N : Nat, V.str (P + single m z + single N 3) (P + single n A)

/-- (Q) Quantity: for w > 1 and m ≥ 1 there is q with m·w ≼ q·(w−1). -/
def Q : Prop := ∀ w : Int, 1 < w → ∀ m : Nat, 0 < m → ∃ q : Nat, 0 < q ∧ V.R (single q (w - 1)) (single m w)

/-- (DA) Dominance Addition (Thomas's strong form): for x > y, z > 0, m, n ≥ 1,
m·y ≼ m·x + n·z. -/
def DA : Prop := ∀ x y z : Int, y < x → 0 < z → ∀ m n : Nat, 0 < m → 0 < n →
  V.R (single m x + single n z) (single m y)

/-- (IA) Inequality Aversion: for x > y > z and m there is C with m·x + C·z ≼ m·y + C·y. -/
def IA : Prop := ∀ x y z : Int, z < y → y < x → ∀ m : Nat, 0 < m → ∃ C : Nat, 0 < C ∧
  V.R (single m y + single C y) (single m x + single C z)

/-- (NS) Non-Sadism: for x > 0 > z, any m, n and finite P,  P + n·z ≼ P + m·x. -/
def NS : Prop := ∀ x z : Int, 0 < x → z < 0 → ∀ m n : Nat, ∀ P : Dist, finite P →
  V.R (P + single m x) (P + single n z)

/-- (NEP) Non-Extreme Priority: there is B such that for any finite P,
P + 1·3 + B·3 ≼ P + 1·(−1) + B·A. -/
def NEP (A : Int) : Prop := ∃ B : Nat, 0 < B ∧ ∀ P : Dist, finite P →
  V.R (P + single 1 (-1) + single B A) (P + single 1 3 + single B 3)

/-- (GNE) General Non-Elitism: as NE but with unrestricted finite background. -/
def GNE : Prop := ∀ x z : Int, z + 1 < x → ∃ G : Nat, 0 < G ∧
  ∀ Rb : Dist, finite Rb → V.R (Rb + single (G + 1) (x - 1)) (Rb + single 1 x + single G z)

/-- (RC) Repugnant Conclusion: for any m ≥ 1 there is M with m·A ≺ M·3. -/
def RC (A : Int) : Prop := ∀ m : Nat, 0 < m → ∃ M : Nat, V.str (single M 3) (single m A)

/-- (VRC) Very Repugnant Conclusion: for any m, n ≥ 1 and z < 0 there is N with
m·z + N·3 ≻ n·A. -/
def VRC (A : Int) : Prop := ∀ m n : Nat, 0 < m → 0 < n → ∀ z : Int, z < 0 → ∃ N : Nat,
  V.str (single m z + single N 3) (single n A)

/-! ### Theorem 1 (Thomas): ED and Q entail RC -/

theorem T1 (A : Int) (hA : 4 ≤ A) (hED : V.ED) (hQ : V.Q) : V.RC A := by
  intro m hm
  -- descend from level A to level 2 by iterating Quantity
  have desc : ∀ k : Nat, (k : Int) ≤ A - 2 → ∃ q : Nat, 0 < q ∧ V.R (single q (A - k)) (single m A) := by
    intro k
    induction k with
    | zero => intro _; exact ⟨m, hm, by simpa using V.refl (single m A)⟩
    | succ k ih =>
      intro hk
      obtain ⟨q, hq, hqR⟩ := ih (by push_cast at hk; omega)
      obtain ⟨q', hq', hq'R⟩ := hQ (A - k) (by push_cast at hk; omega) q hq
      refine ⟨q', hq', ?_⟩
      have e : (A - ((k + 1 : Nat) : Int)) = A - k - 1 := by push_cast; omega
      rw [e]; exact V.trans _ _ _ hq'R hqR
  obtain ⟨q, hq, hqR⟩ := desc (A - 2).toNat (by rw [Int.toNat_of_nonneg (by omega)]; exact Int.le_refl _)
  have e : A - (((A - 2).toNat : Nat) : Int) = 2 := by rw [Int.toNat_of_nonneg (by omega)]; omega
  rw [e] at hqR
  have s := hED 2 3 (by omega) q hq
  exact ⟨q, V.trans _ _ _ s.1 hqR, fun hb => s.2 (V.trans _ _ _ hqR hb)⟩

/-! ### Theorem 2 (Thomas): ED, DA, IA entail RC -/

theorem T2 (A : Int) (_hA : 4 ≤ A) (hED : V.ED) (hDA : V.DA) (hIA : V.IA) : V.RC A := by
  intro m hm
  obtain ⟨C, hC, s2⟩ := hIA (A + 1) 2 1 (by omega) (by omega) m hm
  have s1 := hDA (A + 1) A 1 (by omega) (by omega) m C hm hC
  have s3 := hED 2 3 (by omega) (m + C) (by omega)
  have e : single m 2 + single C 2 = single (m + C) 2 := by dist_ext
  rw [e] at s2
  refine ⟨m + C, V.trans _ _ _ s3.1 (V.trans _ _ _ s2 s1), fun hb => ?_⟩
  exact s3.2 (V.trans _ _ _ (V.trans _ _ _ s2 s1) hb)

/-! ### Theorem 3 (Thomas): ED, IA, NS, NEP entail RA -/

theorem T3 (A : Int) (hA : 4 ≤ A) (hED : V.ED) (hIA : V.IA) (hNS : V.NS) (hNEP : V.NEP A) : V.RA A := by
  obtain ⟨B, hB, hBk⟩ := hNEP
  refine ⟨single (1 + B) 3, finite_single _ _, fun n hn => ?_⟩
  obtain ⟨C, hC, s3⟩ := hIA A 2 1 (by omega) (by omega) (B + n) (by omega)
  have s1 := hBk (single n A) (finite_single _ _)
  have s2 := hNS 1 (-1) (by omega) (by omega) C 1 (single B A + single n A)
    (finite_add (finite_single _ _) (finite_single _ _))
  have s4 := hED 2 3 (by omega) (C + B + n) (by omega)
  have e1 : single n A + single 1 (-1) + single B A = single B A + single n A + single 1 (-1) := by dist_ext
  have e2 : single B A + single n A + single C 1 = single (B + n) A + single C 1 := by dist_ext
  have e3 : single (B + n) 2 + single C 2 = single (C + B + n) 2 := by dist_ext
  have e4 : single n A + single 1 3 + single B 3 = single (1 + B) 3 + single n A := by dist_ext
  have e5 : single (C + B + n) 3 = single (1 + B) 3 + single (C + n - 1) 3 := by dist_ext
  rw [e1, e4] at s1; rw [e2] at s2; rw [e3] at s3
  have chain : V.R (single (C + B + n) 2) (single (1 + B) 3 + single n A) :=
    V.trans _ _ _ s3 (V.trans _ _ _ s2 s1)
  refine ⟨C + n - 1, ?_⟩
  rw [← e5]
  exact ⟨V.trans _ _ _ s4.1 chain, fun hb => s4.2 (V.trans _ _ _ chain hb)⟩

/-! ### Lemma 2 (Thomas): GNEP entails Sufficient Tradeoffs -/

/-- applying GNEP at level ℓ j times -/
theorem gnep_steps (A : Int) (ℓ x y : Int) (G : Nat)
    (hG : ∀ P : Dist, finite P → V.R (P + single 1 (ℓ - 1) + single G x) (P + single 1 ℓ + single G y)) :
    ∀ j : Nat, ∀ P : Dist, finite P →
      V.R (P + single j (ℓ - 1) + single (j * G) x) (P + single j ℓ + single (j * G) y) := by
  intro j
  induction j with
  | zero => intro P _; simp only [Nat.zero_mul, single_zero, add_zero]; exact V.refl P
  | succ j ih =>
    intro P hP
    have h1 := hG (P + single j (ℓ - 1) + single (j * G) x)
      (finite_add (finite_add hP (finite_single _ _)) (finite_single _ _))
    have h2 := ih (P + single 1 ℓ + single G y)
      (finite_add (finite_add hP (finite_single _ _)) (finite_single _ _))
    have e1 : P + single (j + 1) (ℓ - 1) + single ((j + 1) * G) x
        = P + single j (ℓ - 1) + single (j * G) x + single 1 (ℓ - 1) + single G x := by
      dist_ext
    have e2 : P + single j (ℓ - 1) + single (j * G) x + single 1 ℓ + single G y
        = P + single 1 ℓ + single G y + single j (ℓ - 1) + single (j * G) x := by dist_ext
    have e3 : P + single 1 ℓ + single G y + single j ℓ + single (j * G) y
        = P + single (j + 1) ℓ + single ((j + 1) * G) y := by
      dist_ext
    rw [e1, ← e3]; rw [e2] at h1
    exact V.trans _ _ _ h1 h2

/-- (ST) Sufficient Tradeoffs: for z < 0 < y ≤ 3 and any m there is B such that for any
x ≥ A and finite P,  P + m·y + B·y ≼ P + m·z + B·x. -/
theorem ST_of_GNEP (A : Int) (hG : V.GNEP A) (y : Int) (hy0 : 0 < y) (hy3 : y ≤ 3) (m : Nat) :
    ∀ k : Nat, ∃ B : Nat, ∀ x : Int, A ≤ x → ∀ P : Dist, finite P →
      V.R (P + single m (y - k) + single B x) (P + single m y + single B y) := by
  intro k
  induction k with
  | zero =>
    refine ⟨0, fun x _ P _ => ?_⟩
    have : (y - ((0 : Nat) : Int)) = y := by simp
    rw [this]; simp only [single_zero, add_zero]; exact V.refl _
  | succ k ih =>
    obtain ⟨B, hB⟩ := ih
    obtain ⟨G, _, hGk⟩ := hG (y - k)
    refine ⟨B + m * G, fun x hx P hP => ?_⟩
    -- m GNEP-steps at level y - k, from (y-k) down to (y-k-1), raising mG lives from y to x
    have steps := V.gnep_steps A (y - k) x y G (fun Q hQ => hGk x hx y hy0 hy3 Q hQ) m
      (P + single B x) (finite_add hP (finite_single _ _))
    have ih' := hB x hx (P + single (m * G) y) (finite_add hP (finite_single _ _))
    have e0 : y - ((k + 1 : Nat) : Int) = y - k - 1 := by push_cast; omega
    have e1 : P + single m (y - k - 1) + single (B + m * G) x
        = P + single B x + single m (y - k - 1) + single (m * G) x := by
      dist_ext
    have e2 : P + single B x + single m (y - k) + single (m * G) y
        = P + single (m * G) y + single m (y - k) + single B x := by dist_ext
    have e3 : P + single (m * G) y + single m y + single B y
        = P + single m y + single (B + m * G) y := by
      dist_ext
    rw [e0, e1, ← e3]; rw [e2] at steps
    exact V.trans _ _ _ steps ih'

theorem ST (A : Int) (hG : V.GNEP A) (z y : Int) (hz : z < 0) (hy0 : 0 < y) (hy3 : y ≤ 3) (m : Nat) :
    ∃ B : Nat, ∀ x : Int, A ≤ x → ∀ P : Dist, finite P →
      V.R (P + single m z + single B x) (P + single m y + single B y) := by
  obtain ⟨B, hB⟩ := V.ST_of_GNEP A hG y hy0 hy3 m (y - z).toNat
  refine ⟨B, fun x hx P hP => ?_⟩
  have : y - (((y - z).toNat : Nat) : Int) = z := by
    have := Int.toNat_of_nonneg (a := y - z) (by omega); omega
  rw [this] at hB; exact hB x hx P hP

/-! ### Lemma 1 (Thomas): NE entails Inequality-Averse Addition -/

/-- applying NE at level ℓ+1 (with G lives at z) k times -/
theorem ne_steps (ℓ z : Int) (G : Nat)
    (hG : ∀ Rb : Dist, finite Rb → within Rb z (ℓ + 1) →
      V.R (Rb + single (G + 1) ℓ) (Rb + single 1 (ℓ + 1) + single G z))
    (k : Nat) (Rb : Dist) (hRb : finite Rb) (hw : within Rb z (ℓ + 1)) (hzℓ : z ≤ ℓ) :
    ∀ j : Nat, j ≤ k →
      V.R (Rb + single (k - j) (ℓ + 1) + single ((k - j) * G) z + single (j * (G + 1)) ℓ)
          (Rb + single k (ℓ + 1) + single (k * G) z) := by
  intro j
  induction j with
  | zero =>
    intro _; simp only [Nat.sub_zero, Nat.zero_mul, single_zero, add_zero]; exact V.refl _
  | succ j ih =>
    intro hj
    have ih' := ih (by omega)
    have fin' : finite (Rb + single (k - (j + 1)) (ℓ + 1) + single ((k - (j + 1)) * G) z + single (j * (G + 1)) ℓ) :=
      finite_add (finite_add (finite_add hRb (finite_single _ _)) (finite_single _ _)) (finite_single _ _)
    have win' : within (Rb + single (k - (j + 1)) (ℓ + 1) + single ((k - (j + 1)) * G) z + single (j * (G + 1)) ℓ) z (ℓ + 1) :=
      within_add (within_add (within_add hw (within_single ⟨by omega, by omega⟩))
        (within_single ⟨by omega, by omega⟩)) (within_single ⟨by omega, by omega⟩)
    have step := hG _ fin' win'
    have e1 : Rb + single (k - (j + 1)) (ℓ + 1) + single ((k - (j + 1)) * G) z + single (j * (G + 1)) ℓ + single 1 (ℓ + 1) + single G z
        = Rb + single (k - j) (ℓ + 1) + single ((k - j) * G) z + single (j * (G + 1)) ℓ := by
      have a1 : k - j = (k - (j + 1)) + 1 := by omega
      rw [a1]; dist_ext
    have e2 : Rb + single (k - (j + 1)) (ℓ + 1) + single ((k - (j + 1)) * G) z + single (j * (G + 1)) ℓ + single (G + 1) ℓ
        = Rb + single (k - (j + 1)) (ℓ + 1) + single ((k - (j + 1)) * G) z + single ((j + 1) * (G + 1)) ℓ := by dist_ext
    rw [e1] at step; rw [← e2]
    exact V.trans _ _ _ step ih'

/-- (IAA) Inequality-Averse Addition: for z < y < x and any k there is C such that for any
finite P with levels in [z, y+1],  P + k·x + C·z ≼ P + k·y + C·y. -/
theorem IAA_of_NE (hNE : ∀ x z : Int, z + 1 < x → ∃ G : Nat, 0 < G ∧
      ∀ Rb : Dist, finite Rb → within Rb z x →
        V.R (Rb + single (G + 1) (x - 1)) (Rb + single 1 x + single G z))
    (y z : Int) (hzy : z < y) :
    ∀ d : Nat, ∀ k : Nat, ∃ C : Nat, ∀ P : Dist, finite P → within P z (y + 1) →
      V.R (P + single k y + single C y) (P + single k (y + d) + single C z) := by
  intro d
  induction d with
  | zero =>
    intro k; refine ⟨0, fun P _ _ => ?_⟩
    have : (y + ((0 : Nat) : Int)) = y := by simp
    rw [this]; simp only [single_zero, add_zero]; exact V.refl _
  | succ d ih =>
    intro k
    -- NE at level x' = y + d + 1 with z
    obtain ⟨G, _, hGk⟩ := hNE (y + d + 1) z (by omega)
    obtain ⟨C', hC'⟩ := ih (k * (G + 1))
    refine ⟨C' + k * G, fun P hP hw => ?_⟩
    have hGk' : ∀ Rb : Dist, finite Rb → within Rb z ((y + d) + 1) →
        V.R (Rb + single (G + 1) (y + d)) (Rb + single 1 ((y + d) + 1) + single G z) := by
      intro Rb h1 h2
      have := hGk Rb h1 (by simpa using h2)
      have e : (y + d + 1 - 1 : Int) = y + d := by omega
      rw [e] at this; exact this
    have steps := V.ne_steps (y + d) z G hGk' k (P + single C' z) (finite_add hP (finite_single _ _))
      (within_add (within_mono hw (Int.le_refl z) (by omega)) (within_single ⟨Int.le_refl z, by omega⟩)) (by omega) k (Nat.le_refl k)
    simp only [Nat.sub_self, Nat.zero_mul, single_zero, add_zero] at steps
    have ih' := hC' P hP hw
    have e0 : (y + ((d + 1 : Nat) : Int)) = (y + d) + 1 := by push_cast; omega
    have e1 : P + single k ((y + d) + 1) + single (C' + k * G) z
        = P + single C' z + single k ((y + d) + 1) + single (k * G) z := by
      dist_ext
    have e2 : P + single C' z + single (k * (G + 1)) (y + d)
        = P + single (k * (G + 1)) (y + d) + single C' z := by dist_ext
    have e3 : P + single k y + single (C' + k * G) y = P + single (k * (G + 1)) y + single C' y := by
      dist_ext
    rw [e0, e1, e3]; rw [e2] at steps
    exact V.trans _ _ _ ih' steps

theorem IAA (hNE : V.NE) (x y z : Int) (hzy : z < y) (hyx : y < x) (k : Nat) :
    ∃ C : Nat, ∀ P : Dist, finite P → within P z (y + 1) →
      V.R (P + single k y + single C y) (P + single k x + single C z) := by
  obtain ⟨C, hC⟩ := V.IAA_of_NE hNE y z hzy (x - y).toNat k
  refine ⟨C, fun P hP hw => ?_⟩
  have : y + (((x - y).toNat : Nat) : Int) = x := by
    have := Int.toNat_of_nonneg (a := x - y) (by omega); omega
  rw [this] at hC; exact hC P hP hw

/-- applying GNE at level ℓ+1 (with G lives at z) k times: unrestricted background -/
theorem gne_steps (ℓ z : Int) (G : Nat)
    (hG : ∀ Rb : Dist, finite Rb →
      V.R (Rb + single (G + 1) ℓ) (Rb + single 1 (ℓ + 1) + single G z))
    (k : Nat) (Rb : Dist) (hRb : finite Rb) :
    ∀ j : Nat, j ≤ k →
      V.R (Rb + single (k - j) (ℓ + 1) + single ((k - j) * G) z + single (j * (G + 1)) ℓ)
          (Rb + single k (ℓ + 1) + single (k * G) z) := by
  intro j
  induction j with
  | zero =>
    intro _; simp only [Nat.sub_zero, Nat.zero_mul, single_zero, add_zero]; exact V.refl _
  | succ j ih =>
    intro hj
    have ih' := ih (by omega)
    have fin' : finite (Rb + single (k - (j + 1)) (ℓ + 1) + single ((k - (j + 1)) * G) z + single (j * (G + 1)) ℓ) :=
      finite_add (finite_add (finite_add hRb (finite_single _ _)) (finite_single _ _)) (finite_single _ _)
    have step := hG _ fin'
    have e1 : Rb + single (k - (j + 1)) (ℓ + 1) + single ((k - (j + 1)) * G) z + single (j * (G + 1)) ℓ + single 1 (ℓ + 1) + single G z
        = Rb + single (k - j) (ℓ + 1) + single ((k - j) * G) z + single (j * (G + 1)) ℓ := by
      have a1 : k - j = (k - (j + 1)) + 1 := by omega
      rw [a1]; dist_ext
    have e2 : Rb + single (k - (j + 1)) (ℓ + 1) + single ((k - (j + 1)) * G) z + single (j * (G + 1)) ℓ + single (G + 1) ℓ
        = Rb + single (k - (j + 1)) (ℓ + 1) + single ((k - (j + 1)) * G) z + single ((j + 1) * (G + 1)) ℓ := by dist_ext
    rw [e1] at step; rw [← e2]
    exact V.trans _ _ _ step ih'

/-- (GIAA) General Inequality-Averse Addition, from GNE: for z < y < x and any k there is C
such that for any finite P,  P + k·x + C·z ≼ P + k·y + C·y. -/
theorem GIAA_of_GNE (hGNE : V.GNE) (y z : Int) (hzy : z < y) :
    ∀ d : Nat, ∀ k : Nat, ∃ C : Nat, ∀ P : Dist, finite P →
      V.R (P + single k y + single C y) (P + single k (y + d) + single C z) := by
  intro d
  induction d with
  | zero =>
    intro k; refine ⟨0, fun P _ => ?_⟩
    have : (y + ((0 : Nat) : Int)) = y := by simp
    rw [this]; simp only [single_zero, add_zero]; exact V.refl _
  | succ d ih =>
    intro k
    obtain ⟨G, _, hGk⟩ := hGNE (y + d + 1) z (by omega)
    obtain ⟨C', hC'⟩ := ih (k * (G + 1))
    refine ⟨C' + k * G, fun P hP => ?_⟩
    have hGk' : ∀ Rb : Dist, finite Rb →
        V.R (Rb + single (G + 1) (y + d)) (Rb + single 1 ((y + d) + 1) + single G z) := by
      intro Rb h1
      have := hGk Rb h1
      have e : (y + d + 1 - 1 : Int) = y + d := by omega
      rw [e] at this; exact this
    have steps := V.gne_steps (y + d) z G hGk' k (P + single C' z) (finite_add hP (finite_single _ _)) k (Nat.le_refl k)
    simp only [Nat.sub_self, Nat.zero_mul, single_zero, add_zero] at steps
    have ih' := hC' P hP
    have e0 : (y + ((d + 1 : Nat) : Int)) = (y + d) + 1 := by push_cast; omega
    have e1 : P + single k ((y + d) + 1) + single (C' + k * G) z
        = P + single C' z + single k ((y + d) + 1) + single (k * G) z := by dist_ext
    have e2 : P + single C' z + single (k * (G + 1)) (y + d)
        = P + single (k * (G + 1)) (y + d) + single C' z := by dist_ext
    have e3 : P + single k y + single (C' + k * G) y = P + single (k * (G + 1)) y + single C' y := by dist_ext
    rw [e0, e1, e3]; rw [e2] at steps
    exact V.trans _ _ _ ih' steps

theorem GIAA (hGNE : V.GNE) (x y z : Int) (hzy : z < y) (hyx : y < x) (k : Nat) :
    ∃ C : Nat, ∀ P : Dist, finite P →
      V.R (P + single k y + single C y) (P + single k x + single C z) := by
  obtain ⟨C, hC⟩ := V.GIAA_of_GNE hGNE y z hzy (x - y).toNat k
  refine ⟨C, fun P hP => ?_⟩
  have : y + (((x - y).toNat : Nat) : Int) = x := by
    have := Int.toNat_of_nonneg (a := x - y) (by omega); omega
  rw [this] at hC; exact hC P hP

/-! ### Theorem 5 (Thomas): DA, ED, GNE, GNEP entail VRC -/

theorem T5 (A : Int) (hA : 4 ≤ A) (hED : V.ED) (hDA : V.DA) (hGNE : V.GNE) (hG : V.GNEP A) : V.VRC A := by
  intro m n hm hn z hz
  obtain ⟨B, hB⟩ := V.ST A hG z 1 hz (by omega) (by omega) m
  obtain ⟨C, hC⟩ := V.GIAA hGNE (A + 2) 3 1 (by omega) (by omega) (n + B)
  have s1 := hED A (A + 1) (by omega) n hn
  have s2 := hDA (A + 2) (A + 1) 1 (by omega) (by omega) n (m + B + C) hn (by omega)
  have s3 := hB (A + 2) (by omega) (single n (A + 2) + single C 1) (finite_add (finite_single _ _) (finite_single _ _))
  have s4 := hC (single m z) (finite_single _ _)
  have e1 : single n (A + 2) + single (m + B + C) 1 = single n (A + 2) + single C 1 + single m 1 + single B 1 := by dist_ext
  have e2 : single n (A + 2) + single C 1 + single m z + single B (A + 2) = single m z + single (n + B) (A + 2) + single C 1 := by dist_ext
  have e3 : single m z + single (n + B) 3 + single C 3 = single m z + single (n + B + C) 3 := by dist_ext
  rw [e1] at s2; rw [e2] at s3; rw [e3] at s4
  have chain : V.R (single m z + single (n + B + C) 3) (single n (A + 1)) :=
    V.trans _ _ _ s4 (V.trans _ _ _ s3 s2)
  exact ⟨n + B + C, V.trans _ _ _ chain s1.1, fun hb => s1.2 (V.trans _ _ _ hb chain)⟩

/-! ### Theorem 4 (Thomas): ED, GNEP, NE, WNS entail Repugnant Addition -/

/-- The core of Theorem 4, with the free parameter F made explicit: for the fixed
background P' = (B + 2D)·3, and any n and any bound L, there is N > L with
P' + n·A ≺ P' + N·3. -/
theorem RRA (A Z : Int) (hA : 4 ≤ A) (hZ : Z < 0)
    (hED : V.ED) (hG : V.GNEP A) (hNE : V.NE) (hW : V.WNS Z) :
    ∃ P' : Dist, finite P' ∧ ∀ n : Nat, 0 < n → ∀ L : Nat, ∃ N : Nat, L < N ∧
      V.str (P' + single N 3) (P' + single n A) := by
  obtain ⟨D, hWk⟩ := hW
  obtain ⟨B, hB⟩ := V.ST A hG Z 3 hZ (by omega) (by omega) (2 * D)
  refine ⟨single (B + 2 * D) 3, finite_single _ _, fun n hn L => ?_⟩
  obtain ⟨C, hC⟩ := V.IAA hNE A 2 1 (by omega) (by omega) (n + B)
  -- F > 2D, chosen large enough to make N > L
  let F : Nat := L + 2 * D + 1
  refine ⟨n + C + F - 2 * D, by omega, ?_⟩
  -- step 1 (ST): n·A + (B+2D)·3 ≼ n·A + 2D·Z + B·A
  have s1 := hB A (Int.le_refl A) (single n A) (finite_single _ _)
  -- step 2 (WNS): n·A + B·A + D·Z + D·Z ≼ n·A + B·A + D·Z + C·1
  have s2 := hWk 1 (by omega) C (single n A + single B A + single D Z)
    (finite_add (finite_add (finite_single _ _) (finite_single _ _)) (finite_single _ _))
  -- step 3 (WNS): n·A + B·A + C·1 + D·Z ≼ n·A + B·A + C·1 + F·2
  have s3 := hWk 2 (by omega) F (single n A + single B A + single C 1)
    (finite_add (finite_add (finite_single _ _) (finite_single _ _)) (finite_single _ _))
  -- step 4 (IAA): F·2 + (n+B)·A + C·1 ≼ F·2 + (n+B)·2 + C·2
  have s4 := hC (single F 2) (finite_single _ _) (within_single ⟨by omega, by omega⟩)
  -- step 5 (ED): M·2 ≺ M·3
  have s5 := hED 2 3 (by omega) (n + B + C + F) (by omega)
  -- glue
  have e1 : single n A + single (2 * D) Z + single B A = single n A + single B A + single D Z + single D Z := by
    dist_ext
  have e2 : single n A + single B A + single D Z + single C 1 = single n A + single B A + single C 1 + single D Z := by dist_ext
  have e3 : single n A + single B A + single C 1 + single F 2 = single F 2 + single (n + B) A + single C 1 := by
    dist_ext
  have e4 : single F 2 + single (n + B) 2 + single C 2 = single (n + B + C + F) 2 := by
    dist_ext
  have e5 : single (B + 2 * D) 3 + single n A = single n A + single (2 * D) 3 + single B 3 := by
    dist_ext
  have e6 : single (B + 2 * D) 3 + single (n + C + F - 2 * D) 3 = single (n + B + C + F) 3 := by
    dist_ext
  rw [e1] at s1; rw [e2] at s2; rw [e3] at s3; rw [e4] at s4
  have chain : V.R (single (n + B + C + F) 2) (single (B + 2 * D) 3 + single n A) := by
    rw [e5]
    exact V.trans _ _ _ s4 (V.trans _ _ _ s3 (V.trans _ _ _ s2 s1))
  rw [e6]
  refine ⟨V.trans _ _ _ s5.1 chain, fun hback => ?_⟩
  exact s5.2 (V.trans _ _ _ chain hback)

theorem T4 (A Z : Int) (hA : 4 ≤ A) (hZ : Z < 0)
    (hED : V.ED) (hG : V.GNEP A) (hNE : V.NE) (hW : V.WNS Z) : V.RA A := by
  obtain ⟨P', hP', h⟩ := V.RRA A Z hA hZ hED hG hNE hW
  exact ⟨P', hP', fun n hn => by obtain ⟨N, _, hN⟩ := h n hn 0; exact ⟨N, hN⟩⟩

/-! ### Theorem 6* (Thomas): ED, GNEP, NE, WNS entail Very Repugnant Addition* -/

theorem T6star (A Z : Int) (hA : 4 ≤ A) (hZ : Z < 0)
    (hED : V.ED) (hG : V.GNEP A) (hNE : V.NE) (hW : V.WNS Z) : V.VRAstar A := by
  intro z hz m hm
  obtain ⟨P', hP', hRRA⟩ := V.RRA A Z hA hZ hED hG hNE hW
  obtain ⟨B, hB⟩ := V.ST A hG z 3 hz (by omega) (by omega) m
  refine ⟨P' + single B A, finite_add hP' (finite_single _ _), fun n hn => ?_⟩
  obtain ⟨N', hN', hstr⟩ := hRRA (B + n) (by omega) (B + m)
  refine ⟨N' - B - m, ?_⟩
  -- ST with background P' + (N'-B-m)·3:  bg + m·3 + B·3 ≼ bg + m·z + B·A
  have s := hB A (Int.le_refl A) (P' + single (N' - B - m) 3) (finite_add hP' (finite_single _ _))
  have e1 : P' + single (N' - B - m) 3 + single m 3 + single B 3 = P' + single N' 3 := by
    dist_ext
  have e2 : P' + single (N' - B - m) 3 + single m z + single B A = P' + single B A + single m z + single (N' - B - m) 3 := by dist_ext
  have e3 : P' + single (B + n) A = P' + single B A + single n A := by dist_ext
  rw [e1, e2] at s; rw [e3] at hstr
  exact ⟨V.trans _ _ _ s hstr.1, fun hback => hstr.2 (V.trans _ _ _ hback s)⟩

end Axiology
end Arrhenius

namespace Arrhenius
namespace Axiology
open Dist
variable (V : Axiology)

/-! ### Compensation, Proposition 2 and Corollary 3 (Thomas's fixed-threshold vocabulary) -/

/-- (WQA, Thomas's form) for any finite X there are z < 0 and m, n ≥ 1 such that for all N,
X + n·A ≽ X + m·z + N·3. -/
def WQA (A : Int) : Prop := ∀ X : Dist, finite X → ∃ (z : Int) (m n : Nat), z < 0 ∧ 0 < m ∧ 0 < n ∧
  ∀ N : Nat, V.R (X + single n A) (X + single m z + single N 3)

/-- (QA, Thomas's form) Quality Addition: for any finite X there is n ≥ 1 such that for all N,
X + n·A ≽ X + N·3. -/
def QA (A : Int) : Prop := ∀ X : Dist, finite X → ∃ n : Nat, 0 < n ∧
  ∀ N : Nat, V.R (X + single n A) (X + single N 3)

/-- Compensation: any finite quantity of misery added to any population can be made up for by
adding enough lives barely worth living. -/
def Compensation : Prop := ∀ Y : Dist, finite Y → ∀ z : Int, z < 0 → ∀ m : Nat, ∃ K : Nat,
  V.R (Y + single m z + single K 3) Y

/-- Proposition 2: Compensation and WQA entail QA. -/
theorem prop2 (A : Int) (hC : V.Compensation) (hW : V.WQA A) : V.QA A := by
  intro X hX
  obtain ⟨z, m, n, hz, hm, hn, hWk⟩ := hW X hX
  refine ⟨n, hn, fun N => ?_⟩
  obtain ⟨K, hK⟩ := hC (X + single N 3) (finite_add hX (finite_single _ _)) z hz m
  have e : X + single N 3 + single m z + single K 3 = X + single m z + single (N + K) 3 := by dist_ext
  rw [e] at hK
  exact V.trans _ _ _ (hWk (N + K)) hK

/-- Corollary 3: ED, GNEP, NE, WNS, WQA and Compensation are jointly unsatisfiable. -/
theorem cor3 (A Z : Int) (hA : 4 ≤ A) (hZ : Z < 0)
    (hED : V.ED) (hG : V.GNEP A) (hNE : V.NE) (hW : V.WNS Z) (hWQA : V.WQA A) (hC : V.Compensation) :
    False := by
  obtain ⟨P, hP, hRA⟩ := V.T4 A Z hA hZ hED hG hNE hW
  obtain ⟨n, hn, hQ⟩ := V.prop2 A hC hWQA P hP
  obtain ⟨N, hstr⟩ := hRA n hn
  exact hstr.2 (hQ N)

end Axiology
end Arrhenius
