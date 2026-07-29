import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContractTheoryMoralHazardAdverseTheoremCanonicalLaneLean

structure PrincipalAgentContract where
  agentType : Type u
  effortChoice : Type v
  outputDistribution : agentType -> effortChoice -> ProbDist
  contractSpace : Type w
  utilityAgent : agentType -> effortChoice -> contractSpace -> ℝ
  utilityPrincipal : outputDistribution -> contractSpace -> ℝ

structure ContractEvidence (C : PrincipalAgentContract) where
  reservationUtility : ℝ
  participationConstraint : ∀ a : C.agentType, C.utilityAgent a (defaultEffort a) (defaultContract a) ≥ reservationUtility
  incentiveCompatibility : ∀ a : C.agentType, ∀ e1 e2 : C.effortChoice,
    C.utilityAgent a e1 (defaultContract a) ≥ C.utilityAgent a e2 (defaultContract a)

defaultEffort : ∀ (a : Type u), a -> (effortChoice : Type v) -> effortChoice := fun _ _ => default
defaultContract : ∀ (a : Type u), a -> (contractSpace : Type w) -> contractSpace := fun _ _ => default

def ContractClosed (C : PrincipalAgentContract) : Prop :=
  ∀ a : C.agentType, let u_a := C.utilityAgent a in
  (∃ e : C.effortChoice, ∀ e' : C.effortChoice, u_a e (defaultContract a) ≥ u_a e' (defaultContract a)) ∧
  (∃ e : C.effortChoice, u_a e (defaultContract a) ≥ 0)

theorem contract_closed_from_evidence (C : PrincipalAgentContract) (E : ContractEvidence C) :
    ContractClosed C := by
  intro a
  have hPart : C.utilityAgent a (defaultEffort a) (defaultContract a) ≥ E.reservationUtility := E.participationConstraint a
  have hInc : ∀ e1 e2 : C.effortChoice, C.utilityAgent a e1 (defaultContract a) ≥ C.utilityAgent a e2 (defaultContract a) :=
    E.incentiveCompatibility a
  refine ⟨?_, ?_⟩
  · exact ⟨defaultEffort a, hInc defaultEffort a⟩
  · exact ⟨defaultEffort a, by linarith⟩

end ContractTheoryMoralHazardAdverseTheoremCanonicalLaneLean
end HautevilleHouse