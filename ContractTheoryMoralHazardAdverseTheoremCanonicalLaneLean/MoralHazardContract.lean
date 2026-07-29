import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContractTheoryMoralHazardAdverseTheoremCanonicalLaneLean

structure MoralHazardContractPackage where
  agentAction : Type u
  effortCost : Type v
  outputDistribution : Type w
  contractPayment : Type x
  effortUnobservable : Prop
  incentiveConstraint : Prop
  limitedLiability : Prop

structure MoralHazardContractEvidence (P : MoralHazardContractPackage) where
  effortUnobservableClosed : P.effortUnobservable
  incentiveConstraintClosed : P.incentiveConstraint
  limitedLiabilityClosed : P.limitedLiability

def MoralHazardContractClosed (P : MoralHazardContractPackage) : Prop :=
  P.effortUnobservable ∧ P.incentiveConstraint ∧ P.limitedLiability

theorem moral_hazard_contract_closed_from_evidence (P : MoralHazardContractPackage)
    (E : MoralHazardContractEvidence P) : MoralHazardContractClosed P := by
  exact And.intro E.effortUnobservableClosed
    (And.intro E.incentiveConstraintClosed E.limitedLiabilityClosed)

end ContractTheoryMoralHazardAdverseTheoremCanonicalLaneLean
end HautevilleHouse