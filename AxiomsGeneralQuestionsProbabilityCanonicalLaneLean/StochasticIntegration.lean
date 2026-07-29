import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace AxiomsGeneralQuestionsProbabilityCanonicalLaneLean

structure ItoProcessPackage (Ω : Type u) [MeasureTheory.MeasureSpace Ω] where
  filtration : MeasureTheory.Filtration ℝ (MeasureTheory.𝓜 Ω)
  brownianMotion : ℝ → Ω → ℝ
  adapted : ∀ t, MeasureTheory.StronglyMeasurable (brownianMotion t) (filtration t)
  integrand : ℝ → Ω → ℝ
  integrandAdapted : ∀ t, MeasureTheory.StronglyMeasurable (integrand t) (filtration t)
  integrandSquareIntegrable : ∀ T > 0, ∫ ω, ∫ t in (0 : ℝ)..T, (integrand t ω)^2 ∂ MeasureTheory.volume ∂ MeasureTheory.volume < ∞

structure ItoIntegralEvidence {Ω : Type u} [MeasureTheory.MeasureSpace Ω] (P : ItoProcessPackage Ω) where
  integrandSquareIntegrableClosed : P.integrandSquareIntegrable
  itoIntegralDefined : ∃ (I : ℝ → Ω → ℝ), ∀ t, I t = ∫ s in (0 : ℝ)..t, P.integrand s ∂ P.brownianMotion

def ItoIntegralClosed {Ω : Type u} [MeasureTheory.MeasureSpace Ω] (P : ItoProcessPackage Ω) : Prop :=
  P.integrandSquareIntegrable ∧
  (∃ (I : ℝ → Ω → ℝ), ∀ t, I t = ∫ s in (0 : ℝ)..t, P.integrand s ∂ P.brownianMotion)

theorem ito_integral_closed_from_evidence {Ω : Type u} [MeasureTheory.MeasureSpace Ω]
    (P : ItoProcessPackage Ω) (E : ItoIntegralEvidence P) : ItoIntegralClosed P :=
  And.intro E.integrandSquareIntegrableClosed E.itoIntegralDefined

end AxiomsGeneralQuestionsProbabilityCanonicalLaneLean
end HautevilleHouse