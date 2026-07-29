import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace AxiomsGeneralQuestionsProbabilityCanonicalLaneLean

structure BrownianMotionPackage where
  stateSpace : Type
  timeIndex : Type
  continuity : Prop
  independentIncrements : Prop
  stationaryIncrements : Prop
  continuityClosed : continuity
  independentIncrementsClosed : independentIncrements
  stationaryIncrementsClosed : stationaryIncrements

def BrownianMotionClosed (B : BrownianMotionPackage) : Prop :=
  B.continuity ∧ B.independentIncrements ∧ B.stationaryIncrements

theorem brownian_motion_closed_from_evidence (B : BrownianMotionPackage) :
    BrownianMotionClosed B := by
  exact And.intro B.continuityClosed (And.intro B.independentIncrementsClosed B.stationaryIncrementsClosed)

end AxiomsGeneralQuestionsProbabilityCanonicalLaneLean
end HautevilleHouse