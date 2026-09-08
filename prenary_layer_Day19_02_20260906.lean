import Mathlib

-- Day19-02 三层结构：定值版 → 经典退化
-- 定值偏元：动作 op_ε = op₀ + ε（常数留差 ε）
-- 经典：ε = 0（无留差）
-- 退化：ε → 0 时，定值版退回经典

def const_action (op0 ε : ℝ) : ℝ := op0 + ε

-- 定理1：退化锚——ε=0 时定值动作退回经典动作（无留差）
theorem const_degenerate_to_classical (op0 : ℝ) : const_action op0 0 = op0 := by
  unfold const_action
  ring

-- 定理2：非平凡——ε≠0 时定值动作带留差（偏元非经典）
theorem const_non_classical {op0 ε : ℝ} (hε : ε ≠ 0) : const_action op0 ε ≠ op0 := by
  unfold const_action
  intro h
  have : ε = 0 := by linarith
  exact hε this

-- 定理3：留差即偏移量——定值留差 = ε
theorem const_residue_offset (op0 ε : ℝ) : const_action op0 ε - op0 = ε := by
  unfold const_action
  ring
