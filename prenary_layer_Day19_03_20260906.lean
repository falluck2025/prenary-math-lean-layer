import Mathlib

noncomputable section

-- Day19-03 退化链传递性：随机 → 定值 → 经典
def random_variance (δ : ℝ) : ℝ := (δ^2 + (-δ)^2) / 2
def random_expectation (δ : ℝ) : ℝ := (δ + (-δ)) / 2

-- 定理1：随机→定值（方差→0 ⟹ 幅度 δ→0）
theorem variance_zero_implies_delta (δ : ℝ) (h : random_variance δ = 0) : δ = 0 := by
  unfold random_variance at h
  have : δ^2 = 0 := by nlinarith
  exact sq_eq_zero_iff.mp this

-- 定理2：定值→经典（δ=0 ⟹ 期望=0=经典零）
theorem random_degenerate_to_classical (δ : ℝ) (h : δ = 0) : random_expectation δ = 0 := by
  unfold random_expectation
  rw [h]
  ring

-- 定理3：传递性完整链——方差→0 ⟹ 随机留差（期望）退化为经典零
theorem full_degenerate_chain (δ : ℝ) (h : random_variance δ = 0) : random_expectation δ = 0 := by
  have hδ : δ = 0 := variance_zero_implies_delta δ h
  exact random_degenerate_to_classical δ hδ

end
