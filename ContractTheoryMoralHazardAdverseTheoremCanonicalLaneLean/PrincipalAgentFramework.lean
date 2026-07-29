import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContractTheoryMoralHazardAdverseTheoremCanonicalLaneLean

structure PrincipalAgentProblem where
  principalType : Type u
  agentType : Type v
  actionSet : Type w
  outputSet : Type x
  contractSpace : Type y
  principalUtility : outputSet → principalType → ℝ
  agentUtility : outputSet × actionSet → agentType → ℝ
  outsideOption : ℝ
  effortCost : actionSet → ℝ

structure IncentiveCompatibility {A : PrincipalAgentProblem} (contract : A.contractSpace) (action : A.actionSet) where
  incentiveConstraintHolds : Prop
  forAllOtherActions : ∀ (a' : A.actionSet), 
    A.agentUtility (A.outputSet, a') (A.agentType) - A.effortCost a' ≤
    A.agentUtility (A.outputSet, action) (A.agentType) - A.effortCost action

structure ParticipationConstraint {A : PrincipalAgentProblem} (contract : A.contractSpace) (action : A.actionSet) where
  participationHolds : Prop
  agentUtilityAtLeastOutside : A.agentUtility (A.outputSet, action) (A.agentType) - A.effortCost action ≥ A.outsideOption

structure MoralHazardPackage (A : PrincipalAgentProblem) where
  incentiveCompatibleContract : A.contractSpace
  recommendedAction : A.actionSet
  incentiveCompatibilityEvidence : IncentiveCompatibility incentiveCompatibleContract recommendedAction
  participationEvidence : ParticipationConstraint incentiveCompatibleContract recommendedAction

def MoralHazardPackageClosed (A : PrincipalAgentProblem) (M : MoralHazardPackage A) : Prop :=
  M.incentiveCompatibilityEvidence.incentiveConstraintHolds ∧
  M.participationEvidence.participationHolds

theorem moral_hazard_package_closed_from_evidence (A : PrincipalAgentProblem) (M : MoralHazardPackage A) :
  MoralHazardPackageClosed A M := by
  exact And.intro M.incentiveCompatibilityEvidence.incentiveConstraintHolds M.participationEvidence.participationHolds

end ContractTheoryMoralHazardAdverseTheoremCanonicalLaneLean
end HautevilleHouse