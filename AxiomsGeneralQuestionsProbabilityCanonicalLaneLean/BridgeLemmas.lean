import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace AxiomsGeneralQuestionsProbabilityCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  ProbabilityWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end AxiomsGeneralQuestionsProbabilityCanonicalLaneLean
end HautevilleHouse