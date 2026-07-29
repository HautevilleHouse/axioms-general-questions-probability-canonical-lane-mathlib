import AxiomsGeneralQuestionsProbabilityCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace AxiomsGeneralQuestionsProbabilityCanonicalLaneLean

structure LawOfLargeNumbersPackage where
  sampleMean : Type
  convergenceInProbability : Prop
  almostSureConvergence : Prop
  varianceCondition : Prop
  convergenceInProbabilityClosed : convergenceInProbability
  almostSureConvergenceClosed : almostSureConvergence

structure CentralLimitTheoremPackage where
  scaledSum : Type
  convergenceInDistribution : Prop
  normalLimit : Prop
  finiteVariance : Prop
  convergenceInDistributionClosed : convergenceInDistribution
  normalLimitClosed : normalLimit

def LawOfLargeNumbersClosed (L : LawOfLargeNumbersPackage) : Prop :=
  L.convergenceInProbability ∧ L.almostSureConvergence

theorem law_of_large_numbers_closed_from_evidence (L : LawOfLargeNumbersPackage) :
    LawOfLargeNumbersClosed L := by
  exact And.intro L.convergenceInProbabilityClosed L.almostSureConvergenceClosed

data CentralLimitTheoremClosed (C : CentralLimitTheoremPackage) : Prop :=
  C.convergenceInDistribution ∧ C.normalLimit

theorem central_limit_theorem_closed_from_evidence (C : CentralLimitTheoremPackage) :
    CentralLimitTheoremClosed C := by
  exact And.intro C.convergenceInDistributionClosed C.normalLimitClosed

end AxiomsGeneralQuestionsProbabilityCanonicalLaneLean
end HautevilleHouse