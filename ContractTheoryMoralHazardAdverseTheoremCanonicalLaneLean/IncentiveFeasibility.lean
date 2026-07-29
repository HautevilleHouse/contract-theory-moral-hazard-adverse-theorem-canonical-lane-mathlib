import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ContractTheoryMoralHazardAdverseTheoremCanonicalLaneLean.AdverseSelectionModel
import HautevilleHouse.ContractTheoryMoralHazardAdverseTheoremCanonicalLaneLean.MoralHazardContract

namespace HautevilleHouse
namespace ContractTheoryMoralHazardAdverseTheoremCanonicalLaneLean

structure IncentiveFeasibilityPackage
    (A : AdverseSelectionPackage) (M : MoralHazardContractPackage) where
  incentiveCompatibleSet : Type u
  participationFeasible : Prop
  monotonicityCondition : Prop
  singleCrossingCondition : Prop

structure IncentiveFeasibilityEvidence
    {A : AdverseSelectionPackage} {M : MoralHazardContractPackage}
    (P : IncentiveFeasibilityPackage A M) where
  participationFeasibleClosed : P.participationFeasible
  monotonicityConditionClosed : P.monotonicityCondition
  singleCrossingConditionClosed : P.singleCrossingCondition

def IncentiveFeasibilityClosed
    {A : AdverseSelectionPackage} {M : MoralHazardContractPackage}
    (P : IncentiveFeasibilityPackage A M) : Prop :=
  P.participationFeasible ∧ P.monotonicityCondition ∧
  P.singleCrossingCondition

theorem incentive_feasibility_closed_from_evidence
    {A : AdverseSelectionPackage} {M : MoralHazardContractPackage}
    (P : IncentiveFeasibilityPackage A M)
    (E : IncentiveFeasibilityEvidence P) : IncentiveFeasibilityClosed P := by
  exact And.intro E.participationFeasibleClosed
    (And.intro E.monotonicityConditionClosed E.singleCrossingConditionClosed)

end ContractTheoryMoralHazardAdverseTheoremCanonicalLaneLean
end HautevilleHouse