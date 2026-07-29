import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContractTheoryMoralHazardAdverseTheoremCanonicalLaneLean

structure PrincipalAgentModel where
  effortSet : Type u
  outputSet : Type v
  contractSpace : Type w
  utilityPrincipal : Type x
  utilityAgent : Type y
  effortCost : Type z
  reservationUtility : Prop
  incentiveCompatibility : Prop
  individualRationality : Prop
  principalOptimization : Prop
  reservationUtilityTerm : reservationUtility
  incentiveCompatibilityTerm : incentiveCompatibility
  individualRationalityTerm : individualRationality
  principalOptimizationTerm : principalOptimization

structure PrincipalAgentEvidence (M : PrincipalAgentModel) where
  reservationUtilityClosed : M.reservationUtility
  incentiveCompatibilityClosed : M.incentiveCompatibility
  individualRationalityClosed : M.individualRationality
  principalOptimizationClosed : M.principalOptimization

def PrincipalAgentClosed (M : PrincipalAgentModel) : Prop :=
  M.reservationUtility ∧ M.incentiveCompatibility ∧ M.individualRationality ∧ M.principalOptimization

theorem principal_agent_closed_from_evidence (M : PrincipalAgentModel) (E : PrincipalAgentEvidence M) :
  PrincipalAgentClosed M := by
  exact And.intro E.reservationUtilityClosed (And.intro E.incentiveCompatibilityClosed (And.intro E.individualRationalityClosed E.principalOptimizationClosed))

end ContractTheoryMoralHazardAdverseTheoremCanonicalLaneLean
end HautevilleHouse