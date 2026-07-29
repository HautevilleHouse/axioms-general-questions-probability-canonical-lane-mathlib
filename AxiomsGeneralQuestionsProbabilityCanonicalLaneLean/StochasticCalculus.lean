import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace AxiomsGeneralQuestionsProbabilityCanonicalLaneLean

structure ItoIntegralPackage where
  integrator : Type
  integrand : Type
  integralDefined : Prop
  isometryProperty : Prop
  integralClosed : integralDefined
  isometryClosed : isometryProperty

def ItoCalculusClosed (I : ItoIntegralPackage) : Prop :=
  I.integralDefined ∧ I.isometryProperty

theorem ito_calculus_closed_from_evidence (I : ItoIntegralPackage) :
    ItoCalculusClosed I := by
  exact And.intro I.integralClosed I.isometryClosed

end AxiomsGeneralQuestionsProbabilityCanonicalLaneLean
end HautevilleHouse