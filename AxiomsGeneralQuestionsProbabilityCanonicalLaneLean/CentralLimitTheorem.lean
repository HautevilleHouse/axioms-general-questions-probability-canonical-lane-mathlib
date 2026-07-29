import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace AxiomsGeneralQuestionsProbabilityCanonicalLaneLean

structure IIDCenteredSequence (Ω : Type u) [MeasureTheory.MeasureSpace Ω] where
  variables : ℕ → Ω → ℝ
  identicallyDistributed : ∀ n m, (MeasureTheory.law (variables n)) = (MeasureTheory.law (variables m))
  independent : ∀ (s : Finset ℕ), MeasureTheory.Independent (λ i : s => variables i)
  meanZero : ∀ n, ∫ x, variables n x ∂ MeasureTheory.volume = 0
  finiteVariance : ∃ σ2 : ℝ≥0, ∀ n, ∫ x, (variables n x)^2 ∂ MeasureTheory.volume = σ2

structure CentralLimitTheoremEvidence {Ω : Type u} [MeasureTheory.MeasureSpace Ω] (X : IIDCenteredSequence Ω) where
  finiteVarianceClosed : X.finiteVariance
  convergenceInDistribution : ∀ (g : ℝ → ℝ), Continuous g → (λ n : ℕ => ∫ x, g ((∑ i in Finset.range n, X.variables i x) / Real.sqrt (n : ℝ)) ∂ MeasureTheory.volume) ⟶
    ∫ y : ℝ, g y ∂ (MeasureTheory.normalDistribution 0 ⟨(X.finiteVariance.choose : ℝ), by
      have h := X.finiteVariance.choose_spec
      exact h.1
    ⟩)

def CentralLimitTheoremClosed {Ω : Type u} [MeasureTheory.MeasureSpace Ω] (X : IIDCenteredSequence Ω) : Prop :=
  X.finiteVariance ∧
  (∀ (g : ℝ → ℝ), Continuous g → (λ n : ℕ => ∫ x, g ((∑ i in Finset.range n, X.variables i x) / Real.sqrt (n : ℝ)) ∂ MeasureTheory.volume) ⟶
    ∫ y : ℝ, g y ∂ (MeasureTheory.normalDistribution 0 ⟨(X.finiteVariance.choose : ℝ), by
      have h := X.finiteVariance.choose_spec
      exact h.1
    ⟩))

theorem central_limit_closed_from_evidence {Ω : Type u} [MeasureTheory.MeasureSpace Ω]
    (X : IIDCenteredSequence Ω) (E : CentralLimitTheoremEvidence X) : CentralLimitTheoremClosed X :=
  And.intro E.finiteVarianceClosed E.convergenceInDistribution

end AxiomsGeneralQuestionsProbabilityCanonicalLaneLean
end HautevilleHouse