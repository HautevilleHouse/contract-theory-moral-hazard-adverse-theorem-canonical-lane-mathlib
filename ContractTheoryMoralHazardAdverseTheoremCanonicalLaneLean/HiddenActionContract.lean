import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContractTheoryMoralHazardAdverseTheoremCanonicalLaneLean

structure HiddenActionContract where
  actionSpace : Type u
  outcomeSpace : Type v
  contract : Type w
  agentUtility : Type x
  moralHazardConstraint : Prop
  effortChoiceIncentive : Prop
  outputDistribution : Type y
  moralHazardConstraintTerm : moralHazardConstraint
  effortChoiceIncentiveTerm : effortChoiceIncentive

structure HiddenActionContractEvidence (C : HiddenActionContract) where
  moralHazardConstraintClosed : C.moralHazardConstraint
  effortChoiceIncentiveClosed : C.effortChoiceIncentive

def HiddenActionContractClosed (C : HiddenActionContract) : Prop :=
  C.moralHazardConstraint ∧ C.effortChoiceIncentive

theorem hidden_action_contract_closed_from_evidence (C : HiddenActionContract) (E : HiddenActionContractEvidence C) :
  HiddenActionContractClosed C := by
  exact And.intro E.moralHazardConstraintClosed E.effortChoiceIncentiveClosed

end ContractTheoryMoralHazardAdverseTheoremCanonicalLaneLean
end HautevilleHouse