import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContractTheoryMoralHazardAdverseTheoremCanonicalLaneLean

structure ScreeningModel where
  agentType : Type u
  contractSpace : Type v
  utilityAgent : agentType -> contractSpace -> ℝ
  utilityPrincipal : contractSpace -> ℝ
  priorDistribution : agentType -> ℝ

structure ScreeningEvidence (M : ScreeningModel) where
  monotonicity : ∀ a1 a2 : M.agentType, ∀ c1 c2 : M.contractSpace,
    M.utilityAgent a1 c1 ≥ M.utilityAgent a1 c2 → M.utilityAgent a2 c1 ≥ M.utilityAgent a2 c2
  participationConstraint : ∀ a : M.agentType, ∃ c : M.contractSpace, M.utilityAgent a c ≥ 0

def ScreeningClosed (M : ScreeningModel) : Prop :=
  (∀ a1 a2 : M.agentType, ∀ c1 c2 : M.contractSpace, M.utilityAgent a1 c1 ≥ M.utilityAgent a1 c2 → M.utilityAgent a2 c1 ≥ M.utilityAgent a2 c2) ∧
  (∀ a : M.agentType, ∃ c : M.contractSpace, M.utilityAgent a c ≥ 0)

theorem screening_closed_from_evidence (M : ScreeningModel) (E : ScreeningEvidence M) :
    ScreeningClosed M := by
  exact And.intro E.monotonicity E.participationConstraint

end ContractTheoryMoralHazardAdverseTheoremCanonicalLaneLean
end HautevilleHouse