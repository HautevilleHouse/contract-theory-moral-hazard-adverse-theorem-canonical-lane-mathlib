import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContractTheoryMoralHazardAdverseTheoremCanonicalLaneLean

structure OptimalContractProblem where
  agentType : Type u
  effortSpace : Type v
  outputDistribution : effortSpace -> ProbDist
  contractSpace : Type w
  utilityAgent : agentType -> effortSpace -> contractSpace -> ℝ
  utilityPrincipal : outputDistribution -> contractSpace -> ℝ

structure OptimalContractEvidence (P : OptimalContractProblem) where
  participationConstraint : ∀ a : P.agentType, ∃ c : P.contractSpace,
    P.utilityAgent a (defaultEffort a) c ≥ 0
  incentiveConstraint : ∀ a : P.agentType, ∀ e1 e2 : P.effortSpace,
    P.utilityAgent a e1 (defaultContract a) ≥ P.utilityAgent a e2 (defaultContract a)
  principalOptimality : ∀ a : P.agentType, ∀ c : P.contractSpace,
    P.utilityPrincipal (P.outputDistribution (defaultEffort a)) (defaultContract a) ≥
    P.utilityPrincipal (P.outputDistribution (defaultEffort a)) c

defaultEffort : ∀ (a : Type u), a -> (effortSpace : Type v) -> effortSpace := fun _ _ => default
defaultContract : ∀ (a : Type u), a -> (contractSpace : Type w) -> contractSpace := fun _ _ => default

def MoralHazardOptimalContractClosed (P : OptimalContractProblem) : Prop :=
  (∀ a : P.agentType, ∃ c : P.contractSpace, P.utilityAgent a (defaultEffort a) c ≥ 0) ∧
  (∀ a : P.agentType, ∀ e1 e2 : P.effortSpace, P.utilityAgent a e1 (defaultContract a) ≥ P.utilityAgent a e2 (defaultContract a)) ∧
  (∀ a : P.agentType, ∀ c : P.contractSpace, P.utilityPrincipal (P.outputDistribution (defaultEffort a)) (defaultContract a) ≥
    P.utilityPrincipal (P.outputDistribution (defaultEffort a)) c)

theorem moral_hazard_optimal_contract_closed (P : OptimalContractProblem)
    (E : OptimalContractEvidence P) : MoralHazardOptimalContractClosed P := by
  exact And.intro E.participationConstraint (And.intro E.incentiveConstraint E.principalOptimality)

end ContractTheoryMoralHazardAdverseTheoremCanonicalLaneLean
end HautevilleHouse