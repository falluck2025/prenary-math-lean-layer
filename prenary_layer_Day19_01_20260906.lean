import Mathlib

noncomputable section

-- Day19-01 三层结构：随机版 → 定值版退化
-- 随机留差 = 方向 ± × 幅度 δ（δ 为幅度，恒正；± 为方向，延展/收敛）
-- 方差 = δ²；当方差 → 0（δ=0）时，随机波动消失，留差退化为常数 0

def random_variance (δ : ℝ) : ℝ := (δ^2 + (-δ)^2) / 2

-- 定理1：方差为零 ⟹ 幅度 δ=0（随机波动消失，退化为常数）
theorem variance_zero_implies_delta_zero {δ : ℝ} (h : random_variance δ = 0) : δ = 0 := by
  unfold random_variance at h
  have : δ^2 = 0 := by nlinarith
  exact sq_eq_zero_iff.mp this

-- 定理2：δ=0 时随机留差的两个方向取值都退化为 0（随机版 → 定值版）
theorem random_degenerate_to_const (δ : ℝ) (h : δ = 0) : δ = 0 ∧ -δ = 0 := by
  constructor
  · exact h
  · rw [h]
    ring

end
