import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace AxiomsGeneralQuestionsProbabilityCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure ProbabilitySpace where
  carrier : Type
  sigmaAlgebra : Set (Set carrier)
  probabilityMeasure : (carrier -> ℝ) -> ℝ
  isProbabilityMeasure : Prop

structure ProbabilityAdmittedObject where
  space : ProbabilitySpace
  sigmaAlgebraFinite : Prop
  probabilityMeasureComplete : Prop
  conclusion : sigmaAlgebraFinite ∧ probabilityMeasureComplete

structure ProbabilityEndgameState where
  object : ProbabilityAdmittedObject

def ProbabilityWitnessClosed (O : ProbabilityAdmittedObject) : Prop :=
  O.conclusion

end AxiomsGeneralQuestionsProbabilityCanonicalLaneLean
end HautevilleHouse