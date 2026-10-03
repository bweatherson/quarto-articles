/-
  A countermodel to Arrhenius's sixth impossibility theorem (Arrhenius 2009, 2011).

  Populations are finite multisets of lives, each given by an integer welfare level
  (Arrhenius's Discreteness assumption lets welfare levels be indexed by integers).
  We represent a population as a `List Int`; union is `++`.

  The axiology V:
     high P  = number of lives at or above the "very high" level A
     tneg P  = total welfare of the lives with negative welfare (≤ 0)
     I P     = high P + tneg P
     J P     = min 0 (I P)
     V P     = (J P, tot P)   compared lexicographically.
  V is complete and transitive.  We prove it satisfies Arrhenius's five conditions in
  his exact formulations: Egalitarian Dominance, General Non-Extreme Priority,
  Non-Elitism, Weak Non-Sadism, Weak Quality Addition.  We also prove it violates the
  strengthened Weak Quality Addition* of Thomas (2016)/Thornley (2021), in which the
  negative level and the number of negative lives are chosen before the background.
-/
namespace Arrhenius

abbrev Pop := List Int

/-- number of lives with welfare ≥ A -/
def high (A : Int) (P : Pop) : Int := ((P.filter (fun w => decide (A ≤ w))).length : Int)
/-- total welfare of the negative-welfare lives -/
def tneg (P : Pop) : Int := (P.filter (fun w => decide (w < 0))).sum
/-- total welfare -/
def tot (P : Pop) : Int := P.sum

def I (A : Int) (P : Pop) : Int := high A P + tneg P
/-- the capped lexical layer, with baseline capacity c ≥ 0 (c = 0 is the basic capacity view) -/
def J (A c : Int) (P : Pop) : Int := if I A P + c < 0 then I A P + c else 0

/-- "P is at least as good as Q" according to V. -/
def geq (A c : Int) (P Q : Pop) : Prop :=
  J A c Q < J A c P ∨ (J A c P = J A c Q ∧ tot Q ≤ tot P)
/-- "P is better than Q" according to V. -/
def gt (A c : Int) (P Q : Pop) : Prop := geq A c P Q ∧ ¬ geq A c Q P

/-! ### V is a complete quasi-order -/

theorem geq_refl (A c : Int) (P : Pop) : geq A c P P := by
  unfold geq; omega

theorem geq_total (A c : Int) (P Q : Pop) : geq A c P Q ∨ geq A c Q P := by
  unfold geq; omega

theorem geq_trans (A c : Int) (P Q R : Pop) (h1 : geq A c P Q) (h2 : geq A c Q R) : geq A c P R := by
  unfold geq at *; omega

theorem gt_iff (A c : Int) (P Q : Pop) :
    gt A c P Q ↔ (J A c Q < J A c P ∨ (J A c P = J A c Q ∧ tot Q < tot P)) := by
  unfold gt geq; omega

/-! ### Additivity lemmas -/

theorem high_append (A : Int) (P Q : Pop) : high A (P ++ Q) = high A P + high A Q := by
  unfold high; rw [List.filter_append, List.length_append]; omega

theorem tneg_append (P Q : Pop) : tneg (P ++ Q) = tneg P + tneg Q := by
  unfold tneg; rw [List.filter_append, List.sum_append]

theorem tot_append (P Q : Pop) : tot (P ++ Q) = tot P + tot Q := by
  unfold tot; rw [List.sum_append]

theorem I_append (A : Int) (P Q : Pop) : I A (P ++ Q) = I A P + I A Q := by
  unfold I; rw [high_append, tneg_append]; omega

theorem sum_replicate (n : Nat) (x : Int) : (List.replicate n x).sum = n * x := by
  induction n with
  | zero => simp
  | succ k ih =>
    rw [List.replicate_succ, List.sum_cons, ih]
    have : ((k + 1 : Nat) : Int) = (k : Int) + 1 := by omega
    rw [this, Int.add_mul, Int.one_mul]; omega

theorem high_replicate (A : Int) (n : Nat) (x : Int) :
    high A (List.replicate n x) = if A ≤ x then (n : Int) else 0 := by
  unfold high; rw [List.filter_replicate]
  by_cases h : A ≤ x <;> simp [h]

theorem tneg_replicate (n : Nat) (x : Int) :
    tneg (List.replicate n x) = if x < 0 then n * x else 0 := by
  unfold tneg; rw [List.filter_replicate]
  by_cases h : x < 0 <;> simp [h, sum_replicate]

theorem tot_replicate (n : Nat) (x : Int) : tot (List.replicate n x) = n * x := by
  unfold tot; exact sum_replicate n x

theorem high_nonneg (A : Int) (P : Pop) : 0 ≤ high A P := by unfold high; omega
theorem high_le_length (A : Int) (P : Pop) : high A P ≤ P.length := by
  unfold high; have := List.length_filter_le (fun w => decide (A ≤ w)) P; omega
theorem tneg_nonpos (P : Pop) : tneg P ≤ 0 := by
  unfold tneg
  induction P with
  | nil => simp
  | cons a l ih =>
    by_cases h : a < 0
    · simp [List.filter_cons, h, List.sum_cons]; omega
    · simp [List.filter_cons, h]; exact ih

/-- a population all of whose members are below A has no high lives -/
theorem high_eq_zero_of_lt (A : Int) (P : Pop) (h : ∀ w ∈ P, w < A) : high A P = 0 := by
  unfold high
  have : P.filter (fun w => decide (A ≤ w)) = [] := by
    rw [List.filter_eq_nil_iff]; intro w hw; have := h w hw; simp; omega
  rw [this]; simp

/-- a population all of whose members are ≥ 0 has zero negative total -/
theorem tneg_eq_zero_of_nonneg (P : Pop) (h : ∀ w ∈ P, 0 ≤ w) : tneg P = 0 := by
  unfold tneg
  have : P.filter (fun w => decide (w < 0)) = [] := by
    rw [List.filter_eq_nil_iff]; intro w hw; have := h w hw; simp; omega
  rw [this]; simp

/-- a population all of whose members are negative has tneg = tot -/
theorem tneg_eq_tot_of_neg (P : Pop) (h : ∀ w ∈ P, w < 0) : tneg P = tot P := by
  unfold tneg tot
  have : P.filter (fun w => decide (w < 0)) = P := by
    rw [List.filter_eq_self]; intro w hw; have := h w hw; simp; omega
  rw [this]

theorem sum_lt_of_forall_lt (P : Pop) (x : Int) (hne : P ≠ []) (h : ∀ w ∈ P, w < x) :
    P.sum < P.length * x := by
  induction P with
  | nil => exact absurd rfl hne
  | cons a l ih =>
    rw [List.sum_cons, List.length_cons]
    have ha : a < x := h a (by simp)
    have hcast : ((l.length + 1 : Nat) : Int) * x = (l.length : Int) * x + x := by
      have : ((l.length + 1 : Nat) : Int) = (l.length : Int) + 1 := by omega
      rw [this, Int.add_mul, Int.one_mul]
    rw [hcast]
    by_cases hl : l = []
    · subst hl; simp; omega
    · have := ih hl (fun w hw => h w (by simp [hw]))
      omega

theorem sum_le_of_forall_le (P : Pop) (x : Int) (h : ∀ w ∈ P, w ≤ x) :
    P.sum ≤ P.length * x := by
  induction P with
  | nil => simp
  | cons a l ih =>
    rw [List.sum_cons, List.length_cons]
    have ha : a ≤ x := h a (by simp)
    have hcast : ((l.length + 1 : Nat) : Int) * x = (l.length : Int) * x + x := by
      have : ((l.length + 1 : Nat) : Int) = (l.length : Int) + 1 := by omega
      rw [this, Int.add_mul, Int.one_mul]
    rw [hcast]
    have := ih (fun w hw => h w (by simp [hw]))
    omega

theorem sum_ge_of_forall_ge (P : Pop) (x : Int) (h : ∀ w ∈ P, x ≤ w) :
    P.length * x ≤ P.sum := by
  induction P with
  | nil => simp
  | cons a l ih =>
    rw [List.sum_cons, List.length_cons]
    have ha : x ≤ a := h a (by simp)
    have hcast : ((l.length + 1 : Nat) : Int) * x = (l.length : Int) * x + x := by
      have : ((l.length + 1 : Nat) : Int) = (l.length : Int) + 1 := by omega
      rw [this, Int.add_mul, Int.one_mul]
    rw [hcast]
    have := ih (fun w hw => h w (by simp [hw]))
    omega

/-- J is monotone in I -/
theorem J_mono (A c : Int) (P Q : Pop) (h : I A Q ≤ I A P) : J A c Q ≤ J A c P := by
  unfold J; split <;> split <;> omega

/-- the basic sufficient condition for geq: I does not decrease and tot does not decrease -/
theorem geq_of_I_tot (A c : Int) (P Q : Pop) (hI : I A Q ≤ I A P) (ht : tot Q ≤ tot P) :
    geq A c P Q := by
  have := J_mono A c P Q hI; unfold geq; omega

theorem gt_of_I_tot (A c : Int) (P Q : Pop) (hI : I A Q ≤ I A P) (ht : tot Q < tot P) :
    gt A c P Q := by
  have := J_mono A c P Q hI; rw [gt_iff]; omega

end Arrhenius
