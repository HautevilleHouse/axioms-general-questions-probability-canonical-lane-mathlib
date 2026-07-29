import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace AxiomsGeneralQuestionsProbabilityCanonicalLaneLean

structure ProbabilitySpacePackage where
  sampleSpace : Type u
  sigmaAlgebra : Set (Set sampleSpace)
  probabilityMeasure : Set sampleSpace → ℝ
  sigmaAlgebraIsSigmaAlgebra : Prop
  probabilityMeasureNonnegative : Prop
  probabilityMeasureTotalOne : Prop
  probabilityMeasureCountablyAdditive : Prop

structure ProbabilitySpaceEvidence (Ω : ProbabilitySpacePackage) where
  sigmaAlgebraIsSigmaAlgebraClosed : Ω.sigmaAlgebraIsSigmaAlgebra
  probabilityMeasureNonnegativeClosed : Ω.probabilityMeasureNonnegative
  probabilityMeasureTotalOneClosed : Ω.probabilityMeasureTotalOne
  probabilityMeasureCountablyAdditiveClosed : Ω.probabilityMeasureCountablyAdditive

def ProbabilitySpaceClosed (Ω : ProbabilitySpacePackage) : Prop :=
  Ω.sigmaAlgebraIsSigmaAlgebra ∧ Ω.probabilityMeasureNonnegative ∧
  Ω.probabilityMeasureTotalOne ∧ Ω.probabilityMeasureCountablyAdditive

theorem probability_space_closed_from_evidence (Ω : ProbabilitySpacePackage)
    (E : ProbabilitySpaceEvidence Ω) : ProbabilitySpaceClosed Ω := by
  exact And.intro E.sigmaAlgebraIsSigmaAlgebraClosed
    (And.intro E.probabilityMeasureNonnegativeClosed
      (And.intro E.probabilityMeasureTotalOneClosed
        E.probabilityMeasureCountablyAdditiveClosed))

end AxiomsGeneralQuestionsProbabilityCanonicalLaneLean
end HautevilleHouse