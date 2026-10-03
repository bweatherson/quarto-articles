import ArrheniusSix.Basic
/-
  Arrhenius's five adequacy conditions, in the exact formulations of Arrhenius (2011,
  "The impossibility of a satisfactory population ethics", §1.3), and the proof that the
  axiology V of `Basic.lean` satisfies all five.  Throughout, `A` is the "very high"
  welfare level (Arrhenius's `u`), assumed ≥ 4 so that R(1,3) lies strictly below it,
  and welfare levels 1, 2, 3 are the "very low positive" levels (the range R(1,3)).

  Notation: `List.replicate n x` is a population of n lives all at level x
  ("A ⊂ Wx, N(A) = n"); `∀ b ∈ B, 1 ≤ b ∧ b ≤ y` says "B ⊂ R(1,y)".  Arrhenius requires a
  welfare range to contain at least three levels, so R(1,y) carries the side condition 3 ≤ y.
  Deviations from Arrhenius's text, all recorded here: (i) in Egalitarian Dominance the common
  size n is required to be positive, since with n = 0 the condition would assert that the empty
  population is better than itself; (ii) in Weak Non-Sadism the countermodel is shown to satisfy
  the condition with a positive number n of very negative lives, which is a stronger claim than
  Arrhenius's "a number of lives n" requires (the theorems in Theorems.lean and TheoremsExact.lean
  assume only the weaker form, with n possibly 0).
-/
namespace Arrhenius

open List

/-! ### The conditions, as predicates on a betterness relation -/

/-- Egalitarian Dominance (exact): for any populations A, B with N(A) = N(B), and any
welfare level x, if all members of B have welfare below x and A ⊂ Wx, then A is better
than B. -/
def EgalitarianDominance (R : Pop → Pop → Prop) : Prop :=
  ∀ (x : Int) (n : Nat) (B : Pop), 0 < n → B.length = n → (∀ w ∈ B, w < x) →
    R (replicate n x) B ∧ ¬ R B (replicate n x)

/-- General Non-Extreme Priority (exact): for any Wz there is a positive level Wu, a
positive range R(1,y) with u > y, and n > 0 such that if A ⊂ Wx with x ≥ u, B ⊂ R(1,y),
N(A) = N(B) = n, C ⊂ Wz, D ⊂ W(z+1), N(C) = N(D) = 1, then for any E,
A ∪ C ∪ E is at least as good as B ∪ D ∪ E. -/
def GeneralNonExtremePriority (R : Pop → Pop → Prop) : Prop :=
  ∀ z : Int, ∃ (u y : Int) (n : Nat), 3 ≤ y ∧ y < u ∧ 0 < n ∧
    ∀ (x : Int) (B E : Pop), u ≤ x → B.length = n → (∀ b ∈ B, 1 ≤ b ∧ b ≤ y) →
      R (replicate n x ++ [z] ++ E) (B ++ [z + 1] ++ E)

/-- Non-Elitism (exact): for any Wx, Wy with x − 1 > y there is n > 0 such that if
A ⊂ Wx, N(A) = 1, B ⊂ Wy, N(B) = n, C ⊂ W(x−1), N(C) = n+1, then for any D ⊂ R(y,x),
C ∪ D is at least as good as A ∪ B ∪ D. -/
def NonElitism (R : Pop → Pop → Prop) : Prop :=
  ∀ x y : Int, y < x - 1 → ∃ n : Nat, 0 < n ∧
    ∀ D : Pop, (∀ d ∈ D, y ≤ d ∧ d ≤ x) →
      R (replicate (n + 1) (x - 1) ++ D) ([x] ++ replicate n y ++ D)

/-- Weak Non-Sadism (exact): there is a welfare level x < 0 and a number n such that if
A ⊂ Wx, N(A) = n, B ⊂ Wy, y > 0, then for any C, B ∪ C is at least as good as A ∪ C. -/
def WeakNonSadism (R : Pop → Pop → Prop) : Prop :=
  ∃ (x : Int) (n : Nat), x < 0 ∧ 0 < n ∧
    ∀ (y : Int) (B C : Pop), 0 < y → (∀ b ∈ B, b = y) → R (B ++ C) (replicate n x ++ C)

/-- Weak Quality Addition (exact, Arrhenius 2011 p. 9): for any population X there is a
negative level x, positive ranges R(u,v) and R(1,y) with u > y, and sizes n, m > 0 such
that if A ⊂ Wz with z ≥ u, N(A) = n, B ⊂ R(1,y), C ⊂ Wx, N(C) = m, then
A ∪ X is at least as good as B ∪ C ∪ X. -/
def WeakQualityAddition (R : Pop → Pop → Prop) : Prop :=
  ∀ X : Pop, ∃ (x u y : Int) (n m : Nat), x < 0 ∧ 3 ≤ y ∧ y < u ∧ 0 < n ∧ 0 < m ∧
    ∀ (z : Int) (B : Pop), u ≤ z → (∀ b ∈ B, 1 ≤ b ∧ b ≤ y) →
      R (replicate n z ++ X) (B ++ replicate m x ++ X)

/-- Weak Quality Addition* (Thomas 2016; Thornley 2021): as WQA but with the negative
level x and the number m of negative lives chosen before the background X. -/
def WeakQualityAdditionStar (R : Pop → Pop → Prop) : Prop :=
  ∃ (x : Int) (m : Nat), x < 0 ∧ 0 < m ∧
    ∀ X : Pop, ∃ (u y : Int) (n : Nat), 3 ≤ y ∧ y < u ∧ 0 < n ∧
      ∀ (z : Int) (B : Pop), u ≤ z → (∀ b ∈ B, 1 ≤ b ∧ b ≤ y) →
        R (replicate n z ++ X) (B ++ replicate m x ++ X)

/-! ### V satisfies the five conditions -/

section
variable (A c : Int) (hA : 4 ≤ A) (hc : 0 ≤ c)

theorem V_ED : EgalitarianDominance (geq A c) := by
  intro x n B hn hB hb
  have hne : B ≠ [] := by intro h; subst h; simp at hB; omega
  have htot : tot B < tot (replicate n x) := by
    rw [tot_replicate]; unfold tot; have := sum_lt_of_forall_lt B x hne hb; rw [hB] at this; exact this
  have hI : I A B ≤ I A (replicate n x) := by
    unfold I; rw [high_replicate, tneg_replicate]
    have h1 := high_le_length A B
    have h2 := high_nonneg A B
    have h3 := tneg_nonpos B
    by_cases hx : A ≤ x
    · simp only [hx, if_true]
      by_cases hneg : x < 0
      · simp only [hneg, if_true]
        have : tneg B = tot B := tneg_eq_tot_of_neg B (fun w hw => by have := hb w hw; omega)
        rw [tot_replicate] at htot; omega
      · simp only [hneg, if_false]; omega
    · simp only [hx, if_false]
      have h0 : high A B = 0 := high_eq_zero_of_lt A B (fun w hw => by have := hb w hw; omega)
      by_cases hneg : x < 0
      · simp only [hneg, if_true]
        have : tneg B = tot B := tneg_eq_tot_of_neg B (fun w hw => by have := hb w hw; omega)
        rw [tot_replicate] at htot; omega
      · simp only [hneg, if_false]; omega
  exact gt_of_I_tot A c _ _ hI htot

include hA in
theorem V_GNEP : GeneralNonExtremePriority (geq A c) := by
  intro z
  refine ⟨A, 3, 2, by omega, by omega, by omega, ?_⟩
  intro x B E hx hB hb
  apply geq_of_I_tot
  · rw [I_append, I_append, I_append, I_append]
    have hBhigh : high A B = 0 := high_eq_zero_of_lt A B (fun w hw => by have := hb w hw; omega)
    have hBneg : tneg B = 0 := tneg_eq_zero_of_nonneg B (fun w hw => by have := hb w hw; omega)
    have e1 : I A (replicate 2 x) = 2 := by
      unfold I; rw [high_replicate, tneg_replicate]; simp only [hx, if_true]
      have : ¬ x < 0 := by omega
      simp [this]
    have e2 : I A B = 0 := by unfold I; omega
    have e3 : I A [z] = (if A ≤ z then 1 else 0) + (if z < 0 then z else 0) := by
      unfold I; have := high_replicate A 1 z; have := tneg_replicate 1 z; simp at *; omega
    have e4 : I A [z + 1] = (if A ≤ z + 1 then 1 else 0) + (if z + 1 < 0 then z + 1 else 0) := by
      unfold I; have := high_replicate A 1 (z+1); have := tneg_replicate 1 (z+1); simp at *; omega
    rw [e1, e2, e3, e4]; split <;> split <;> split <;> split <;> omega
  · rw [tot_append, tot_append, tot_append, tot_append, tot_replicate]
    have : tot B ≤ 2 * 3 := by
      unfold tot; have := sum_le_of_forall_le B 3 (fun w hw => (hb w hw).2); rw [hB] at this; simpa using this
    have e1 : tot [z] = z := by simp [tot]
    have e2 : tot [z + 1] = z + 1 := by simp [tot]
    rw [e1, e2]; omega

include hA hc in
theorem V_NE : NonElitism (geq A c) := by
  intro x y hxy
  refine ⟨1, by omega, ?_⟩
  intro D hD
  show geq A c (replicate 2 (x - 1) ++ D) ([x] ++ replicate 1 y ++ D)
  have e1 : I A (replicate 2 (x - 1)) = (if A ≤ x - 1 then 2 else 0) + (if x - 1 < 0 then 2 * (x - 1) else 0) := by
    unfold I; rw [high_replicate, tneg_replicate]; simp
  have e2 : I A [x] = (if A ≤ x then 1 else 0) + (if x < 0 then x else 0) := by
    unfold I; have := high_replicate A 1 x; have := tneg_replicate 1 x; simp at *; omega
  have e3 : I A (replicate 1 y) = (if A ≤ y then 1 else 0) + (if y < 0 then y else 0) := by
    unfold I; rw [high_replicate, tneg_replicate]; simp
  have ht : tot (replicate 2 (x - 1) ++ D) = 2 * (x - 1) + tot D := by
    rw [tot_append, tot_replicate]; simp
  have ht' : tot ([x] ++ replicate 1 y ++ D) = x + y + tot D := by
    rw [tot_append, tot_append, tot_replicate]; simp [tot]
  by_cases hy : 0 ≤ y
  · -- no negative lives anywhere: both J's vanish, and totals decide
    have hDneg : tneg D = 0 := tneg_eq_zero_of_nonneg D (fun d hd => by have := hD d hd; omega)
    have hL : 0 ≤ I A (replicate 2 (x - 1) ++ D) := by
      rw [I_append, e1]; unfold I; have := high_nonneg A D
      have : ¬ (x - 1 < 0) := by omega
      simp only [this, if_false]; split <;> omega
    have hR : 0 ≤ I A ([x] ++ replicate 1 y ++ D) := by
      rw [I_append, I_append, e2, e3]; unfold I; have := high_nonneg A D
      have h1 : ¬ (x < 0) := by omega
      have h2 : ¬ (y < 0) := by omega
      simp only [h1, h2, if_false]; split <;> split <;> omega
    have hJL : J A c (replicate 2 (x - 1) ++ D) = 0 := by unfold J; split <;> omega
    have hJR : J A c ([x] ++ replicate 1 y ++ D) = 0 := by unfold J; split <;> omega
    unfold geq; rw [hJL, hJR]; omega
  · apply geq_of_I_tot
    · rw [I_append, I_append, I_append, e1, e2, e3]
      split <;> split <;> split <;> split <;> split <;> split <;> omega
    · rw [ht, ht']; omega

include hA in
theorem V_WNS : WeakNonSadism (geq A c) := by
  refine ⟨-1, 1, by omega, by omega, ?_⟩
  intro y B C hy hb
  apply geq_of_I_tot
  · rw [I_append, I_append]
    have hBneg : tneg B = 0 := tneg_eq_zero_of_nonneg B (fun w hw => by have := hb w hw; omega)
    have h0 := high_nonneg A B
    have hIB : I A B = high A B := by unfold I; omega
    have e : I A (replicate 1 (-1)) = -1 := by
      unfold I; rw [high_replicate, tneg_replicate]; have : ¬ A ≤ -1 := by omega
      simp [this]
    omega
  · rw [tot_append, tot_append, tot_replicate]
    have : (B.length : Int) * 0 ≤ tot B := by
      unfold tot; exact sum_ge_of_forall_ge B 0 (fun w hw => by have := hb w hw; omega)
    simp at this; omega

include hA in
theorem V_WQA : WeakQualityAddition (geq A c) := by
  intro X
  refine ⟨-1, A, 3, 1, (I A X + c).toNat + 1, by omega, by omega, by omega, by omega, by omega, ?_⟩
  intro z B hz hb
  have hBhigh : high A B = 0 := high_eq_zero_of_lt A B (fun w hw => by have := hb w hw; omega)
  have hBneg : tneg B = 0 := tneg_eq_zero_of_nonneg B (fun w hw => by have := hb w hw; omega)
  have eL : I A (replicate 1 z ++ X) = 1 + I A X := by
    rw [I_append]; unfold I; rw [high_replicate, tneg_replicate]
    have h1 : A ≤ z := hz
    have h2 : ¬ z < 0 := by omega
    simp [h1, h2]
  have eR : I A (B ++ replicate ((I A X + c).toNat + 1) (-1) ++ X) = I A X - ((I A X + c).toNat + 1 : Nat) := by
    rw [I_append, I_append]
    have : I A B = 0 := by unfold I; omega
    rw [this]; unfold I; rw [high_replicate, tneg_replicate]
    have h1 : ¬ A ≤ -1 := by omega
    simp [h1]; omega
  have hm : I A X + c ≤ ((I A X + c).toNat : Int) := Int.self_le_toNat _
  -- the right-hand side has negative I, the left-hand side has larger I: J decides
  unfold geq J; rw [eL, eR]; push_cast at *; split <;> split <;> omega

end

/-! ### V violates Weak Quality Addition* -/

theorem V_not_WQAstar (A c : Int) (hA : 4 ≤ A) (hc : 0 ≤ c) : ¬ WeakQualityAdditionStar (geq A c) := by
  intro h
  obtain ⟨x, m, hx, hm, h⟩ := h
  -- background: m·|x| lives at level A, so that the m lives at x are exactly offset
  obtain ⟨k, hk'⟩ : ∃ k : Nat, (k : Int) = -x := ⟨(-x).toNat, Int.toNat_of_nonneg (by omega)⟩
  obtain ⟨u, y, n, hy, hyu, hn, hR⟩ := h (replicate (m * k) A)
  -- choose z ≥ max(u, A), and B = N lives at level 1 with N large
  obtain ⟨z, hzu, hzA⟩ : ∃ z : Int, u ≤ z ∧ A ≤ z :=
    ⟨if u ≤ A then A else u, by split <;> omega, by split <;> omega⟩
  obtain ⟨N, hN'⟩ : ∃ N : Nat, (n : Int) * z - (m : Int) * x + 1 ≤ (N : Int) :=
    ⟨((n : Int) * z - (m : Int) * x + 1).toNat, Int.self_le_toNat _⟩
  have hB : ∀ b ∈ replicate N (1 : Int), 1 ≤ b ∧ b ≤ y := by
    intro b hb; rw [List.mem_replicate] at hb; omega
  have := hR z (replicate N 1) hzu hB
  -- compute both sides
  have hX : I A (replicate (m * k) A) = ((m * k : Nat) : Int) := by
    unfold I; rw [high_replicate, tneg_replicate]
    have h1 : A ≤ A := Int.le_refl A
    have h2 : ¬ A < 0 := by omega
    simp [h1, h2]
  have eL : I A (replicate n z ++ replicate (m * k) A) = n + ((m * k : Nat) : Int) := by
    rw [I_append, hX]; unfold I; rw [high_replicate, tneg_replicate]
    have h2 : ¬ z < 0 := by omega
    simp [hzA, h2]
  have eR : I A (replicate N 1 ++ replicate m x ++ replicate (m * k) A) = (m : Int) * x + ((m * k : Nat) : Int) := by
    rw [I_append, I_append, hX]; unfold I; rw [high_replicate, tneg_replicate, high_replicate, tneg_replicate]
    have h1 : ¬ A ≤ 1 := by omega
    have h3 : ¬ A ≤ x := by omega
    simp [h1, h3, hx]
  have hcast : ((m * k : Nat) : Int) = (m : Int) * (k : Int) := by push_cast; rfl
  have hmk : (m : Int) * x + ((m * k : Nat) : Int) = 0 := by rw [hcast, hk', Int.mul_neg]; omega
  have tL : tot (replicate n z ++ replicate (m * k) A) = (n : Int) * z + ((m * k : Nat) : Int) * A := by
    rw [tot_append, tot_replicate, tot_replicate]
  have tR : tot (replicate N 1 ++ replicate m x ++ replicate (m * k) A) = (N : Int) + (m : Int) * x + ((m * k : Nat) : Int) * A := by
    rw [tot_append, tot_append, tot_replicate, tot_replicate, tot_replicate]; omega
  unfold geq J at this
  rw [eL, eR, hmk, tL, tR] at this
  have hpos : 0 < (n : Int) + ((m * k : Nat) : Int) := by omega
  generalize (n : Int) * z = nz at this hN'
  generalize (m : Int) * x = mx at this hN'
  generalize ((m * k : Nat) : Int) * A = mkA at this
  generalize ((m * k : Nat) : Int) = mk at this hpos
  split at this <;> split at this <;> omega

end Arrhenius

namespace Arrhenius

/-- **Main theorem.** For every "very high" level A ≥ 4 and baseline capacity c ≥ 0, the
complete and transitive axiology V satisfies Arrhenius's five conditions (so his sixth impossibility theorem is
false as stated), and violates the strengthened Weak Quality Addition* (so the repaired
theorem of Thomas/Thornley is not refuted by V). -/
theorem sixth_theorem_countermodel (A c : Int) (hA : 4 ≤ A) (hc : 0 ≤ c) :
    (∀ P Q, geq A c P Q ∨ geq A c Q P) ∧
    (∀ P Q R, geq A c P Q → geq A c Q R → geq A c P R) ∧
    EgalitarianDominance (geq A c) ∧
    GeneralNonExtremePriority (geq A c) ∧
    NonElitism (geq A c) ∧
    WeakNonSadism (geq A c) ∧
    WeakQualityAddition (geq A c) ∧
    ¬ WeakQualityAdditionStar (geq A c) :=
  ⟨geq_total A c, geq_trans A c, V_ED A c, V_GNEP A c hA, V_NE A c hA hc, V_WNS A c hA, V_WQA A c hA,
   V_not_WQAstar A c hA hc⟩

end Arrhenius
