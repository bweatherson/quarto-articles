import ArrheniusSix.Theorems
/-
  The corrected sixth theorem for Arrhenius's EXACT conditions (2011, §1.3), in which the
  "very high" level u and the low range R(1,y) are chosen existentially inside General
  Non-Extreme Priority and Weak Quality Addition*, and the low lives B may lie at mixed
  levels in R(1,y).  Conclusion: the strengthened Weak Quality Addition* of Thomas/Thornley
  is unsatisfiable together with ED, GNEP, NE, WNS.
-/
namespace Arrhenius
open Dist

namespace Dist
/-- the distribution of a list of welfare levels -/
def ofList : List Int → Dist
  | [] => 0
  | a :: l => single 1 a + ofList l

theorem ofList_replicate (n : Nat) (x : Int) : ofList (List.replicate n x) = single n x := by
  induction n with
  | zero => simp [ofList, single_zero]
  | succ k ih =>
    rw [List.replicate_succ, ofList, ih]
    funext w; simp only [add_apply, single_apply]; split <;> omega
end Dist

namespace Axiology
variable (V : Axiology)

/-- (GNEP, exact) For any z there are a positive level u, a range R(1,y) (3 ≤ y < u) and n > 0
such that for any x ≥ u, any population B ⊂ R(1,y) with N(B) = n (B may be at mixed levels;
we give it as a list L of n levels in [1,y]), and any finite E:  n·x + 1·z + E ≽ B + 1·(z+1) + E. -/
def GNEPexact : Prop := ∀ z : Int, ∃ (u y : Int) (n : Nat), 3 ≤ y ∧ y < u ∧ 0 < n ∧
  ∀ x : Int, u ≤ x → ∀ L : List Int, L.length = n → (∀ b ∈ L, 1 ≤ b ∧ b ≤ y) →
    ∀ P : Dist, finite P → V.R (P + single n x + single 1 z) (P + ofList L + single 1 (z + 1))

/-- (ED, exact) if every member of B is below x and N(B) = n then n·x ≻ B; we use only the
instances with B perfectly equal, which is Thomas's ED. -/
def EDexact : Prop := V.ED

/-- (WNS, exact) there are x < 0 and n > 0 such that for any y > 0, any size k and any
finite C: k·y + C ≽ n·x + C. -/
def WNSexact : Prop := ∃ (x : Int) (n : Nat), x < 0 ∧
  ∀ y : Int, 0 < y → ∀ k : Nat, ∀ C : Dist, finite C → V.R (C + single k y) (C + single n x)

/-- (WQA*, exact; Thomas 2016 / Thornley 2021) there are x < 0 and m > 0 such that for any
finite X there are u, y (3 ≤ y < u) and n > 0 such that for any z ≥ u and any finite
B ⊂ R(1,y):  n·z + X ≽ B + m·x + X. -/
def WQAstarExact : Prop := ∃ (x : Int) (m : Nat), x < 0 ∧ 0 < m ∧
  ∀ X : Dist, finite X → ∃ (u y : Int) (n : Nat), 3 ≤ y ∧ y < u ∧ 0 < n ∧
    ∀ z : Int, u ≤ z → ∀ B : Dist, finite B → within B 1 y →
      V.R (X + single n z) (X + B + single m x)

/-! ### Sufficient Tradeoffs from exact GNEP, with a uniform high level -/

/-- for z < 0 and m there are U and B such that for every x ≥ U and finite P,
P + m·3 + B·3 ≼ P + m·z + B·x. -/
theorem STexact (hG : V.GNEPexact) (m : Nat) :
    ∀ k : Nat, ∃ (U : Int) (B : Nat), ∀ x : Int, U ≤ x → ∀ P : Dist, finite P →
      V.R (P + single m (3 - k) + single B x) (P + single m 3 + single B 3) := by
  intro k
  induction k with
  | zero =>
    refine ⟨4, 0, fun x _ P _ => ?_⟩
    have : ((3 : Int) - ((0 : Nat) : Int)) = 3 := by simp
    rw [this]; simp only [single_zero, add_zero]; exact V.refl _
  | succ k ih =>
    obtain ⟨U, B, hB⟩ := ih
    obtain ⟨u, y, n, hy3, hyu, hn, hGk⟩ := hG (3 - k - 1)
    refine ⟨if U ≤ u then u else U, B + m * n, fun x hx P hP => ?_⟩
    have hxU : U ≤ x := by split at hx <;> omega
    have hxu : u ≤ x := by split at hx <;> omega
    -- one GNEP step at level 3-k, with the n low lives all at level 3
    have step1 : ∀ Q : Dist, finite Q →
        V.R (Q + single 1 (3 - k - 1) + single n x) (Q + single 1 (3 - k) + single n 3) := by
      intro Q hQ
      have h := hGk x hxu (List.replicate n 3) (List.length_replicate) (fun b hb => by rw [List.mem_replicate] at hb; omega) Q hQ
      rw [ofList_replicate] at h
      have e1 : Q + single n x + single 1 (3 - k - 1) = Q + single 1 (3 - k - 1) + single n x := by dist_ext
      have e2 : Q + single n 3 + single 1 (3 - k - 1 + 1) = Q + single 1 (3 - k) + single n 3 := by
        have : (3 - k - 1 + 1 : Int) = 3 - k := by omega
        rw [this]; dist_ext
      rw [e1, e2] at h; exact h
    have steps := V.gnep_steps 4 (3 - k) x 3 n step1 m (P + single B x) (finite_add hP (finite_single _ _))
    have ih' := hB x hxU (P + single (m * n) 3) (finite_add hP (finite_single _ _))
    have e0 : (3 : Int) - ((k + 1 : Nat) : Int) = 3 - k - 1 := by push_cast; omega
    have e1 : P + single m (3 - k - 1) + single (B + m * n) x
        = P + single B x + single m (3 - k - 1) + single (m * n) x := by dist_ext
    have e2 : P + single B x + single m (3 - k) + single (m * n) 3
        = P + single (m * n) 3 + single m (3 - k) + single B x := by dist_ext
    have e3 : P + single (m * n) 3 + single m 3 + single B 3 = P + single m 3 + single (B + m * n) 3 := by dist_ext
    rw [e0, e1, ← e3]; rw [e2] at steps
    exact V.trans _ _ _ steps ih'

theorem STexact' (hG : V.GNEPexact) (z : Int) (hz : z < 0) (m : Nat) :
    ∃ (U : Int) (B : Nat), 4 ≤ U ∧ ∀ x : Int, U ≤ x → ∀ P : Dist, finite P →
      V.R (P + single m z + single B x) (P + single m 3 + single B 3) := by
  obtain ⟨U, B, hB⟩ := V.STexact hG m (3 - z).toNat
  have e : (3 : Int) - (((3 - z).toNat : Nat) : Int) = z := by
    have := Int.toNat_of_nonneg (a := 3 - z) (by omega); omega
  rw [e] at hB
  refine ⟨if U ≤ 4 then 4 else U, B, by split <;> omega, fun x hx P hP => hB x (by split at hx <;> omega) P hP⟩

/-! ### Theorem 6* for the exact conditions -/

theorem T6star_exact (hED : V.ED) (hG : V.GNEPexact) (hNE : V.NE) (hW : V.WNSexact) :
    ¬ V.WQAstarExact := by
  intro hQ
  obtain ⟨x, m, hx, hm, hQ⟩ := hQ
  obtain ⟨Z, D, hZ, hWk⟩ := hW
  -- ST for Z with 2D lives, and for x with m lives, each at a uniform high level
  obtain ⟨U0, B0, hU0, hST0⟩ := V.STexact' hG Z hZ (2 * D)
  obtain ⟨U1, B1, hU1, hST1⟩ := V.STexact' hG x hx m
  -- the common high level and the background X
  obtain ⟨xh, hxh0, hxh1, hxh4⟩ : ∃ xh : Int, U0 ≤ xh ∧ U1 ≤ xh ∧ 4 ≤ xh :=
    ⟨if U0 ≤ U1 then U1 else U0, by split <;> omega, by split <;> omega, by split <;> omega⟩
  let P' : Dist := single (B0 + 2 * D) 3
  obtain ⟨u, y, n, hy3, hyu, hn, hQk⟩ := hQ (P' + single B1 xh) (finite_add (finite_single _ _) (finite_single _ _))
  -- choose the high level z ≥ u, at least xh
  obtain ⟨z, hzu, hzx⟩ : ∃ z : Int, u ≤ z ∧ xh ≤ z :=
    ⟨if u ≤ xh then xh else u, by split <;> omega, by split <;> omega⟩
  -- merging step: bring the n lives at z down to xh (using C2 lives at 1), or nothing if z = xh
  have merge : ∃ C2 : Nat, ∀ Q : Dist, finite Q → within Q 1 (xh + 1) →
      V.R (Q + single (n + C2) xh) (Q + single n z + single C2 1) := by
    by_cases hzeq : z = xh
    · subst hzeq
      refine ⟨0, fun Q _ _ => ?_⟩
      simp only [single_zero, add_zero, Nat.add_zero]; exact V.refl _
    · obtain ⟨C2, hC2⟩ := V.IAA hNE z xh 1 (by omega) (by omega) n
      refine ⟨C2, fun Q hQf hQw => ?_⟩
      have := hC2 Q hQf hQw
      have e : Q + single n xh + single C2 xh = Q + single (n + C2) xh := by dist_ext
      rw [e] at this; exact this
  obtain ⟨C2, hmerge⟩ := merge
  -- lowering all high lives from xh to 2
  obtain ⟨C, hC⟩ := V.IAA hNE xh 2 1 (by omega) (by omega) (B0 + B1 + n + C2)
  -- F > 2D large enough that N ≥ 1
  let F : Nat := 2 * D + m + 1
  let M : Nat := F + C + C2 + B0 + B1 + n
  let N : Nat := M - (B0 + 2 * D) - B1 - m
  have hN : N + (B0 + 2 * D) + B1 + m = M := by omega
  -- the chain
  -- s1 (ST at Z): P' + B1·xh + n·z ≼ 2D·Z + B0·xh + B1·xh + n·z
  have s1 := hST0 xh hxh0 (single B1 xh + single n z) (finite_add (finite_single _ _) (finite_single _ _))
  -- s2 (WNS): D·Z → (C + C2)·1
  have s2 := hWk 1 (by omega) (C + C2) (single D Z + single (B0 + B1) xh + single n z)
    (finite_add (finite_add (finite_single _ _) (finite_single _ _)) (finite_single _ _))
  -- s3 (WNS): D·Z → F·2
  have s3 := hWk 2 (by omega) F (single (C + C2) 1 + single (B0 + B1) xh + single n z)
    (finite_add (finite_add (finite_single _ _) (finite_single _ _)) (finite_single _ _))
  -- s4 (merge): n·z + C2·1 → (n+C2)·xh, background F·2 + C·1 + (B0+B1)·xh
  have s4 := hmerge (single F 2 + single C 1 + single (B0 + B1) xh)
    (finite_add (finite_add (finite_single _ _) (finite_single _ _)) (finite_single _ _))
    (within_add (within_add (within_single ⟨by omega, by omega⟩) (within_single ⟨by omega, by omega⟩))
      (within_single ⟨by omega, by omega⟩))
  -- s5 (IAA): all highs down to 2, background F·2
  have s5 := hC (single F 2) (finite_single _ _) (within_single ⟨by omega, by omega⟩)
  -- s6 (ED): M·2 ≺ M·3
  have s6 := hED 2 3 (by omega) M (by omega)
  -- s7 (ST at x): P' + N·3 + m·3 + B1·3 ≼ P' + N·3 + m·x + B1·xh
  have s7 := hST1 xh hxh1 (P' + single N 3) (finite_add (finite_single _ _) (finite_single _ _))
  -- glue the populations
  have e1 : single B1 xh + single n z + single (2 * D) Z + single B0 xh
      = single D Z + single (B0 + B1) xh + single n z + single D Z := by dist_ext
  have e2 : single D Z + single (B0 + B1) xh + single n z + single (C + C2) 1
      = single (C + C2) 1 + single (B0 + B1) xh + single n z + single D Z := by dist_ext
  have e3 : single (C + C2) 1 + single (B0 + B1) xh + single n z + single F 2
      = single F 2 + single C 1 + single (B0 + B1) xh + single n z + single C2 1 := by dist_ext
  have e4 : single F 2 + single C 1 + single (B0 + B1) xh + single (n + C2) xh
      = single F 2 + single (B0 + B1 + n + C2) xh + single C 1 := by dist_ext
  have e5 : single F 2 + single (B0 + B1 + n + C2) 2 + single C 2 = single M 2 := by dist_ext
  have e6 : single M 3 = P' + single N 3 + single m 3 + single B1 3 := by
    show single M 3 = single (B0 + 2 * D) 3 + single N 3 + single m 3 + single B1 3
    dist_ext
  have e7 : P' + single N 3 + single m x + single B1 xh = P' + single B1 xh + single N 3 + single m x := by
    show single (B0 + 2 * D) 3 + single N 3 + single m x + single B1 xh
      = single (B0 + 2 * D) 3 + single B1 xh + single N 3 + single m x
    dist_ext
  have e8 : single B1 xh + single n z + single (2 * D) 3 + single B0 3 = P' + single B1 xh + single n z := by
    show single B1 xh + single n z + single (2 * D) 3 + single B0 3 = single (B0 + 2 * D) 3 + single B1 xh + single n z
    dist_ext
  rw [e1, e8] at s1; rw [e2] at s2; rw [e3] at s3; rw [e4] at s4; rw [e5] at s5
  rw [← e6, e7] at s7
  -- the strict chain from P' + B1·xh + n·z up to M·3
  have chain : V.R (single M 2) (P' + single B1 xh + single n z) :=
    V.trans _ _ _ s5 (V.trans _ _ _ s4 (V.trans _ _ _ s3 (V.trans _ _ _ s2 s1)))
  have up : V.R (P' + single B1 xh + single N 3 + single m x) (P' + single B1 xh + single n z) :=
    V.trans _ _ _ s7 (V.trans _ _ _ s6.1 chain)
  have notback : ¬ V.R (P' + single B1 xh + single n z) (P' + single B1 xh + single N 3 + single m x) := by
    intro hb
    exact s6.2 (V.trans _ _ _ chain (V.trans _ _ _ hb s7))
  -- WQA* says the reverse comparison holds with B = N·3 ⊂ R(1,y)
  have hQz := hQk z hzu (single N 3) (finite_single _ _) (within_single ⟨by omega, by omega⟩)
  
  exact notback hQz

end Axiology
end Arrhenius
