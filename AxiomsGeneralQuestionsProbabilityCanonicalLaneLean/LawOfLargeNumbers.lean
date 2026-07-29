import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace AxiomsGeneralQuestionsProbabilityCanonicalLaneLean

structure IIDSequence (Ω : Type u) [MeasureTheory.MeasureSpace Ω] where
  variables : ℕ → Ω → ℝ
  identicallyDistributed : ∀ n m, (MeasureTheory.law (variables n)) = (MeasureTheory.law (variables m))
  independent : ∀ (s : Finset ℕ), MeasureTheory.Independent (λ i : s => variables i)
  finiteExpectation : ∃ μ : ℝ, ∀ n, ∫ x, variables n x ∂ MeasureTheory.volume = μ

structure LawOfLargeNumbersEvidence {Ω : Type u} [MeasureTheory.MeasureSpace Ω] (X : IIDSequence Ω) where
  finiteExpectationClosed : X.finiteExpectation
  strongLawHolds : ∀ᵐ ω ∂ MeasureTheory.volume,
    Filter.Tendsto (λ n : ℕ => (∑ i in Finset.range n, X.variables i ω) / (n : ℝ)) Filter.atTop (𝓝 (∫ x, X.variables 0 x ∂ MeasureTheory.volume))

def StrongLawOfLargeNumbersClosed {Ω : Type u} [MeasureTheory.MeasureSpace Ω] (X : IIDSequence Ω) : Prop :=
  X.finiteExpectation ∧
  (∀ᵐ ω ∂ MeasureTheory.volume,
    Filter.Tendsto (λ n : ℕ => (∑ i in Finset.range n, X.variables i ω) / (n : ℝ)) Filter.atTop (𝓝 (∫ x, X.variables 0 x ∂ MeasureTheory.volume)))

theorem strong_law_closed_from_evidence {Ω : Type u} [MeasureTheory.MeasureSpace Ω]
    (X : IIDSequence Ω) (E : LawOfLargeNumbersEvidence X) : StrongLawOfLargeNumbersClosed X :=
  And.intro E.finiteExpectationClosed E.strongLawHolds

end AxiomsGeneralQuestionsProbabilityCanonicalLaneLean
end HautevilleHouse