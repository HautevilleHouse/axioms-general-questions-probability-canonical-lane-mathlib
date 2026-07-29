import canonicleLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace AxiomsGeneralQuestionsProbabilityCanonicalLaneLean

structure ConvergenceTheoremsPackage (Ω : ProbabilitySpace) where
  monotoneConvergence : Prop
  dominatedConvergence : Prop
  fatouLemma : Prop

structure ConvergenceTheoremsEvidence {Ω : ProbabilitySpace} (C : ConvergenceTheoremsPackage Ω) where
  monotoneConvergenceClosed : C.monotoneConvergence
  dominatedConvergenceClosed : C.dominatedConvergence
  fatouLemmaClosed : C.fatouLemma

def ConvergenceTheoremsClosed {Ω : ProbabilitySpace} (C : ConvergenceTheoremsPackage Ω) : Prop :=
  C.monotoneConvergence ∧ C.dominatedConvergence ∧ C.fatouLemma

theorem convergence_theorems_closed_from_evidence {Ω : ProbabilitySpace} (C : ConvergenceTheoremsPackage Ω)
    (E : ConvergenceTheoremsEvidence C) : ConvergenceTheoremsClosed C := by
  exact And.intro E.monotoneConvergenceClosed
    (And.intro E.dominatedConvergenceClosed E.fatouLemmaClosed)

end AxiomsGeneralQuestionsProbabilityCanonicalLaneLean
end HautevilleHouse