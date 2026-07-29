import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace AxiomsGeneralQuestionsProbability

structure RandomVariablePackage (Ω : Type u) (P : ProbabilityAxiomsPackage Ω) where
  function : Ω → ℝ
  measurable : ∀ (B : Set ℝ), B ∈ borelSets → function⁻¹' B ∈ P.sigmaAlgebra
  expectation : ℝ
  expectationProperty : expectation = ∫ x, function x ∂P.probabilityMeasure

structure RandomVariableEvidence (Ω : Type u) {P : ProbabilityAxiomsPackage Ω} (X : RandomVariablePackage Ω P) where
  measurableClosed : X.measurable
  expectationPropertyClosed : X.expectationProperty

def RandomVariableClosed (Ω : Type u) {P : ProbabilityAxiomsPackage Ω} (X : RandomVariablePackage Ω P) : Prop :=
  X.measurable ∧ X.expectationProperty

theorem random_variable_closed_from_evidence (Ω : Type u) {P : ProbabilityAxiomsPackage Ω} (X : RandomVariablePackage Ω P) (E : RandomVariableEvidence Ω X) :
    RandomVariableClosed Ω X := by
  exact And.intro E.measurableClosed E.expectationPropertyClosed

end AxiomsGeneralQuestionsProbability
end HautevilleHouse