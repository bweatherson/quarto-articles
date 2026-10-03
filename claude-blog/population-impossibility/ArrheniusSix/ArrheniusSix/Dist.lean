/-
  Welfare distributions as count functions (Thomas 2016): a distribution assigns to each
  integer welfare level the number of lives at that level.  We require finite support.
  Union is pointwise addition.  This representation makes the reordering steps in the
  impossibility proofs trivial (`ac_rfl`).
-/
namespace Arrhenius

def Dist := Int → Nat

namespace Dist

instance : Add Dist := ⟨fun P Q w => P w + Q w⟩
instance : Zero Dist := ⟨fun _ => 0⟩

@[simp] theorem add_apply (P Q : Dist) (w : Int) : (P + Q) w = P w + Q w := rfl
@[simp] theorem zero_apply (w : Int) : (0 : Dist) w = 0 := rfl

theorem add_comm (P Q : Dist) : P + Q = Q + P := by funext w; simp [Nat.add_comm]
theorem add_assoc (P Q S : Dist) : P + Q + S = P + (Q + S) := by funext w; simp [Nat.add_assoc]
theorem add_zero (P : Dist) : P + 0 = P := by funext w; simp
theorem zero_add (P : Dist) : 0 + P = P := by funext w; simp

instance : Std.Commutative (α := Dist) (· + ·) := ⟨add_comm⟩
instance : Std.Associative (α := Dist) (· + ·) := ⟨add_assoc⟩

/-- `single n x`: n lives all at welfare level x  (Arrhenius: A ⊂ Wx, N(A) = n). -/
def single (n : Nat) (x : Int) : Dist := fun w => if w = x then n else 0

@[simp] theorem single_apply (n : Nat) (x w : Int) : single n x w = if w = x then n else 0 := rfl

theorem single_add (a b : Nat) (x : Int) : single a x + single b x = single (a + b) x := by
  funext w; simp only [add_apply, single_apply]; split <;> omega

theorem single_zero (x : Int) : single 0 x = 0 := by
  funext w; simp only [single_apply, zero_apply]; split <;> rfl

theorem single_one_mul (G : Nat) (x : Int) (j : Nat) :
    single j x + single G x = single (j + G) x := single_add j G x

/-- finite support -/
def finite (P : Dist) : Prop := ∃ b : Nat, ∀ w : Int, ((b : Int) < w ∨ w < -(b : Int)) → P w = 0

theorem finite_zero : finite (0 : Dist) := ⟨0, fun _ _ => rfl⟩

theorem finite_single (n : Nat) (x : Int) : finite (single n x) := by
  refine ⟨x.natAbs, fun w hw => ?_⟩
  simp only [single_apply]
  have : w ≠ x := by omega
  simp [this]

theorem finite_add {P Q : Dist} (hP : finite P) (hQ : finite Q) : finite (P + Q) := by
  obtain ⟨b1, h1⟩ := hP; obtain ⟨b2, h2⟩ := hQ
  refine ⟨b1 + b2, fun w hw => ?_⟩
  simp only [add_apply]
  rw [h1 w (by omega), h2 w (by omega)]

/-- all lives of P lie in the welfare range [lo, hi] -/
def within (P : Dist) (lo hi : Int) : Prop := ∀ w : Int, P w ≠ 0 → lo ≤ w ∧ w ≤ hi

theorem within_add {P Q : Dist} {lo hi : Int} (hP : within P lo hi) (hQ : within Q lo hi) :
    within (P + Q) lo hi := by
  intro w hw; simp only [add_apply] at hw
  by_cases h : P w = 0
  · exact hQ w (by omega)
  · exact hP w h

theorem within_single {n : Nat} {x lo hi : Int} (h : lo ≤ x ∧ x ≤ hi) : within (single n x) lo hi := by
  intro w hw; simp only [single_apply] at hw
  by_cases e : w = x
  · subst e; exact h
  · simp [e] at hw

theorem within_mono {P : Dist} {lo hi lo' hi' : Int} (h : within P lo hi) (h1 : lo' ≤ lo) (h2 : hi ≤ hi') :
    within P lo' hi' := fun w hw => by have := h w hw; omega

end Dist
end Arrhenius
