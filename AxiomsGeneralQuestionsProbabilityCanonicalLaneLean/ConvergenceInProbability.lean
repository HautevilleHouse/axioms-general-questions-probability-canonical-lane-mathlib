import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace AxiomsGeneralQuestionsProbability

structure ConvergenceInProbabilityPackage (Ω : Type u) (P : ProbabilityAxiomsPackage Ω) where
  sequence : ℕ → (Ω → ℝ)
  limit : Ω → ℝ
  condition : ∀ ε > 0, P.probabilityMeasure {ω | |sequence n ω - limit ω| ≥ ε} → 0 as n → ∞

structure ConvergenceInProbabilityEvidence (Ω : Type u) {P : ProbabilityAxiomsPackage Ω} (C : ConvergenceInProbabilityPackage Ω P) where
  conditionClosed : C.condition

def ConvergenceInProbabilityClosed (Ω : Type u) {P : ProbabilityAxiomsPackage Ω} (C : ConvergenceInProbabilityPackage Ω P) : Prop :=
  C.condition

theorem convergence_in_probability_closed_from_evidence (Ω : Type u) {P : ProbabilityAxiomsPackage Ω} (C : ConvergenceInProbabilityPackage Ω P) (E : ConvergenceInProbabilityEvidence Ω C) :
    ConvergenceInProbabilityClosed Ω C := by
  exact E.conditionClosed

end AxiomsGeneralQuestionsProbability
end HautevilleHouse