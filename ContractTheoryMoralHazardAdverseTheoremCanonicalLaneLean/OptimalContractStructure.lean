import ContractTheoryMoralHazardAdverseTheoremCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace ContractTheoryMoralHazardAdverseTheoremCanonicalLaneLean

struct OptimalContractStructure where
  effortLevel : ℝ
  paymentSchedule : ℝ → ℝ
  expectedUtilityAgent : ℝ
  expectedUtilityPrincipal : ℝ
  incentiveCompatibilityConstraint : Prop
  individualRationalityConstraint : Prop
  optimalityCondition : Prop

def OptimalityConditionClosed (O : OptimalContractStructure) : Prop :=
  O.optimalityCondition

end ContractTheoryMoralHazardAdverseTheoremCanonicalLaneLean
end HautevilleHouse