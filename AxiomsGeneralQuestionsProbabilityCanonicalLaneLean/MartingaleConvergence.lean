import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace AxiomsGeneralQuestionsProbabilityCanonicalLaneLean

structure MartingalePackage (Ω : Type u) [MeasureTheory.MeasureSpace Ω] where
  filtration : MeasureTheory.Filtration ℕ (MeasureTheory.𝓜 Ω)
  process : ℕ → Ω → ℝ
  adapted : ∀ n, MeasureTheory.StronglyMeasurable (process n) (filtration n)
  integrable : ∀ n, MeasureTheory.Integrable (process n)
  martingaleProperty : ∀ n m, n ≤ m → ∀ᵐ ω ∂ MeasureTheory.volume, (∫ (process m) ∂ MeasureTheory.volume) | filtration n = process n ω

structure MartingaleEvidence {Ω : Type u} [MeasureTheory.MeasureSpace Ω] (M : MartingalePackage Ω) where
  martingalePropertyClosed : M.martingaleProperty
  convergenceInL1 : ∀ (ℱ : MeasureTheory.Filtration ℕ (MeasureTheory.𝓜 Ω)), ∃ (X∞ : Ω → ℝ), MeasureTheory.StronglyMeasurable X∞ (⨆ n, ℱ n) ∧
    Filter.Tendsto (λ n : ℕ => ∫ x, |M.process n x - X∞ x| ∂ MeasureTheory.volume) Filter.atTop (𝓝 0)

def MartingaleConvergenceClosed {Ω : Type u} [MeasureTheory.MeasureSpace Ω] (M : MartingalePackage Ω) : Prop :=
  M.martingaleProperty ∧
  (∀ (ℱ : MeasureTheory.Filtration ℕ (MeasureTheory.𝓜 Ω)), ∃ (X∞ : Ω → ℝ), MeasureTheory.StronglyMeasurable X∞ (⨆ n, ℱ n) ∧
    Filter.Tendsto (λ n : ℕ => ∫ x, |M.process n x - X∞ x| ∂ MeasureTheory.volume) Filter.atTop (𝓝 0))

theorem martingale_convergence_closed_from_evidence {Ω : Type u} [MeasureTheory.MeasureSpace Ω]
    (M : MartingalePackage Ω) (E : MartingaleEvidence M) : MartingaleConvergenceClosed M :=
  And.intro E.martingalePropertyClosed E.convergenceInL1

end AxiomsGeneralQuestionsProbabilityCanonicalLaneLean
end HautevilleHouse