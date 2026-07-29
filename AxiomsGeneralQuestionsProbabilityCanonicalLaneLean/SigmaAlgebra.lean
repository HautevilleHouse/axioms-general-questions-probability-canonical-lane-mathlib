import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace AxiomsGeneralQuestionsProbability

structure SigmaAlgebraPackage (Ω : Type u) where
  sets : Set (Set Ω)
  emptyMem : ∅ ∈ sets
  complMem : ∀ s, s ∈ sets → (sᶜ) ∈ sets
  unionCountable : ∀ (E : ℕ → Set Ω), (∀ i, E i ∈ sets) → (⋃ i, E i) ∈ sets

structure SigmaAlgebraEvidence (Ω : Type u) (S : SigmaAlgebraPackage Ω) where
  emptyMemClosed : S.emptyMem
  complMemClosed : S.complMem
  unionCountableClosed : S.unionCountable

def SigmaAlgebraClosed (Ω : Type u) (S : SigmaAlgebraPackage Ω) : Prop :=
  S.emptyMem ∧ S.complMem ∧ S.unionCountable

theorem sigma_algebra_closed_from_evidence (Ω : Type u) (S : SigmaAlgebraPackage Ω) (E : SigmaAlgebraEvidence Ω S) :
    SigmaAlgebraClosed Ω S := by
  exact And.intro E.emptyMemClosed (And.intro E.complMemClosed E.unionCountableClosed)

end AxiomsGeneralQuestionsProbability
end HautevilleHouse