import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContractTheoryMoralHazardAdverseTheoremCanonicalLaneLean

structure IncentiveCompatibilityCore where
  effortChoiceSet : Type
  outputSet : Type
  contractFunction : outputSet → Type
  agentUtility : Type
  principalUtility : Type
  incentiveConstraint : Prop
  individualRationality : Prop
  optimalContractExists : Prop

structure IncentiveCompatibilityEvidence (I : IncentiveCompatibilityCore) where
  incentiveConstraintClosed : I.incentiveConstraint
  individualRationalityClosed : I.individualRationality
  optimalContractExistsClosed : I.optimalContractExists

def IncentiveCompatibilityClosed (I : IncentiveCompatibilityCore) : Prop :=
  I.incentiveConstraint ∧ I.individualRationality ∧ I.optimalContractExists

theorem incentive_compatibility_closed_from_evidence
    (I : IncentiveCompatibilityCore) (E : IncentiveCompatibilityEvidence I) :
    IncentiveCompatibilityClosed I := by
  exact And.intro E.incentiveConstraintClosed
    (And.intro E.individualRationalityClosed E.optimalContractExistsClosed)

end ContractTheoryMoralHazardAdverseTheoremCanonicalLaneLean
end HautevilleHouse