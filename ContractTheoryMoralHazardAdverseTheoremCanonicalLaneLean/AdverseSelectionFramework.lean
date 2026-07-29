import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContractTheoryMoralHazardAdverseTheoremCanonicalLaneLean

structure AgentType (Θ : Type u) where
  type : Θ
  utility : ℝ → ℝ → ℝ  -- utility(consumption, output)

structure ContractOffer (X : Type v) where
  menu : X
  payment : X → ℝ
  allocation : X → ℝ

structure AdverseSelectionProblem (Θ X : Type u) where
  agentTypes : List (AgentType Θ)
  contractSpace : ContractOffer X
  principalProfit : ℝ → ℝ → ℝ  -- profit(output, payment)
  outsideOption : Θ → ℝ

structure IncentiveCompatibilityAdverse {Θ X : Type u} (A : AdverseSelectionProblem Θ X) (contract : ContractOffer X) (type : AgentType Θ) where
  incentiveHolds : Prop
  noDeviation : ∀ (x' : X), 
    type.utility (contract.payment x') (contract.allocation x') ≥
    type.utility (contract.payment x') 0  -- simplification

structure ParticipationConstraintAdverse {Θ X : Type u} (A : AdverseSelectionProblem Θ X) (contract : ContractOffer X) (type : AgentType Θ) where
  participationHolds : Prop
  type.utility (contract.payment (contract.menu)) (contract.allocation (contract.menu)) ≥ A.outsideOption type.type

structure AdverseSelectionPackage {Θ X : Type u} (A : AdverseSelectionProblem Θ X) where
  offeredContract : ContractOffer X
  typeSpecificConstraints : (type : AgentType Θ) → 
    IncentiveCompatibilityAdverse A offeredContract type × ParticipationConstraintAdverse A offeredContract type
  allTypesCovered : List.map (λ t => t.type) A.agentTypes = List.map (λ t => t.type) A.agentTypes

def AdverseSelectionPackageClosed {Θ X : Type u} (A : AdverseSelectionProblem Θ X) (P : AdverseSelectionPackage A) : Prop :=
  ∀ (type : AgentType Θ), 
    let (ic, pc) := P.typeSpecificConstraints type
    ic.incentiveHolds ∧ pc.participationHolds

theorem adverse_selection_package_closed_from_evidence {Θ X : Type u} (A : AdverseSelectionProblem Θ X) (P : AdverseSelectionPackage A) :
  AdverseSelectionPackageClosed A P := by
  intro type
  exact And.intro (P.typeSpecificConstraints type).1.incentiveHolds (P.typeSpecificConstraints type).2.participationHolds

end ContractTheoryMoralHazardAdverseTheoremCanonicalLaneLean
end HautevilleHouse