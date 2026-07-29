import ContractTheoryMoralHazardAdverseTheoremCanonicalLaneLean.PrincipalAgentRoute

namespace HautevilleHouse
namespace ContractTheoryMoralHazardAdverseTheoremCanonicalLaneLean

structure HiddenActionAnalyticCertificate (H : HiddenActionPackage) where
  effortChoiceSpace : Prop
  outputDistribution : Prop
  contractMapping : Prop
  moralHazardConstraint : Prop
  effortChoiceSpaceClosed : effortChoiceSpace
  outputDistributionClosed : outputDistribution
  contractMappingClosed : contractMapping
  moralHazardConstraintClosed : moralHazardConstraint
  hiddenActionEvidence : HiddenActionEvidence H

def HiddenActionAnalyticCertificateClosed {H : HiddenActionPackage} (C : HiddenActionAnalyticCertificate H) : Prop :=
  C.effortChoiceSpace ∧ C.outputDistribution ∧ C.contractMapping ∧ C.moralHazardConstraint ∧ HiddenActionClosed H

theorem hidden_action_analytic_certificate_closed
    {H : HiddenActionPackage} (C : HiddenActionAnalyticCertificate H) :
    HiddenActionAnalyticCertificateClosed C := by
  exact And.intro C.effortChoiceSpaceClosed
    (And.intro C.outputDistributionClosed
      (And.intro C.contractMappingClosed
        (And.intro C.moralHazardConstraintClosed
          (hidden_action_closed_from_evidence H C.hiddenActionEvidence))))

structure AdverseSelectionAnalyticCertificate {H : HiddenActionPackage} (A : AdverseSelectionPackage H) where
  agentTypeSpace : Prop
  contractOfferMenu : Prop
  screeningMechanism : Prop
  incentiveCompatibility : Prop
  participationConstraint : Prop
  agentTypeSpaceClosed : agentTypeSpace
  contractOfferMenuClosed : contractOfferMenu
  screeningMechanismClosed : screeningMechanism
  incentiveCompatibilityClosed : incentiveCompatibility
  participationConstraintClosed : participationConstraint
  adverseSelectionEvidence : AdverseSelectionEvidence A

def AdverseSelectionAnalyticCertificateClosed {H : HiddenActionPackage} {A : AdverseSelectionPackage H} (C : AdverseSelectionAnalyticCertificate A) : Prop :=
  C.agentTypeSpace ∧ C.contractOfferMenu ∧ C.screeningMechanism ∧ C.incentiveCompatibility ∧ C.participationConstraint ∧ AdverseSelectionClosed A

theorem adverse_selection_analytic_certificate_closed
    {H : HiddenActionPackage} {A : AdverseSelectionPackage H} (C : AdverseSelectionAnalyticCertificate A) :
    AdverseSelectionAnalyticCertificateClosed C := by
  exact And.intro C.agentTypeSpaceClosed
    (And.intro C.contractOfferMenuClosed
      (And.intro C.screeningMechanismClosed
        (And.intro C.incentiveCompatibilityClosed
          (And.intro C.participationConstraintClosed
            (adverse_selection_closed_from_evidence A C.adverseSelectionEvidence)))))

end ContractTheoryMoralHazardAdverseTheoremCanonicalLaneLean
end HautevilleHouse