import canonicleLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace AxiomsGeneralQuestionsProbabilityCanonicalLaneLean

structure KolmogorovAxiomsPackage (Ω : ProbabilitySpace) where
  nonnegativity : Prop
  normalization : Ω.probabilityMeasure (fun _ => 1) = 1
  countableAdditivity : Prop
  sigmaAlgebraMeasurable : Prop

structure KolmogorovAxiomsEvidence {Ω : ProbabilitySpace} (K : KolmogorovAxiomsPackage Ω) where
  nonnegativityClosed : K.nonnegativity
  normalizationClosed : K.normalization
  countableAdditivityClosed : K.countableAdditivity
  sigmaAlgebraMeasurableClosed : K.sigmaAlgebraMeasurable

def KolmogorovAxiomsClosed {Ω : ProbabilitySpace} (K : KolmogorovAxiomsPackage Ω) : Prop :=
  K.nonnegativity ∧ K.normalization ∧ K.countableAdditivity ∧ K.sigmaAlgebraMeasurable

theorem kolmogorov_axioms_closed_from_evidence {Ω : ProbabilitySpace} (K : KolmogorovAxiomsPackage Ω)
    (E : KolmogorovAxiomsEvidence K) : KolmogorovAxiomsClosed K := by
  exact And.intro E.nonnegativityClosed
    (And.intro E.normalizationClosed
      (And.intro E.countableAdditivityClosed E.sigmaAlgebraMeasurableClosed))

end AxiomsGeneralQuestionsProbabilityCanonicalLaneLean
end HautevilleHouse