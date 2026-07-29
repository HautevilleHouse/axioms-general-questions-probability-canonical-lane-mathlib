import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace AxiomsGeneralQuestionsProbability

structure ProbabilityAxiomsPackage where
  sampleSpace : Type u
  sigmaAlgebra : Set (Set sampleSpace)
  probabilityMeasure : (Set sampleSpace) → ℝ
  nonnegativity : ∀ s, 0 ≤ probabilityMeasure s
  unitMass : probabilityMeasure (Set.univ) = 1
  countableAdditivity : ∀ (E : ℕ → Set sampleSpace), (∀ i j, i ≠ j → Disjoint (E i) (E j)) →
    probabilityMeasure (⋃ i, E i) = ∑' i, probabilityMeasure (E i)

structure ProbabilityAxiomsEvidence (P : ProbabilityAxiomsPackage) where
  nonnegativityClosed : P.nonnegativity
  unitMassClosed : P.unitMass
  countableAdditivityClosed : P.countableAdditivity

def ProbabilityAxiomsClosed (P : ProbabilityAxiomsPackage) : Prop :=
  P.nonnegativity ∧ P.unitMass ∧ P.countableAdditivity

theorem probability_axioms_closed_from_evidence (P : ProbabilityAxiomsPackage) (E : ProbabilityAxiomsEvidence P) :
    ProbabilityAxiomsClosed P := by
  exact And.intro E.nonnegativityClosed (And.intro E.unitMassClosed E.countableAdditivityClosed)

end AxiomsGeneralQuestionsProbability
end HautevilleHouse