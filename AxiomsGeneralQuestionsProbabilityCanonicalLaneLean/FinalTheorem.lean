import canonicalLaneMathlib.AdmissibleClass
import AxiomsGeneralQuestionsProbability.BridgeLemmas
import AxiomsGeneralQuestionsProbability.GateLemmas

namespace HautevilleHouse
namespace AxiomsGeneralQuestionsProbability

def ConstrainedProbabilityClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_probability_endgame (A : AdmissibleClass) :
    ConstrainedProbabilityClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end AxiomsGeneralQuestionsProbability
end HautevilleHouse