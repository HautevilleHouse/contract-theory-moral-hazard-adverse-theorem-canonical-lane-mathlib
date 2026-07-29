import ContractTheoryMoralHazardAdverseTheoremCanonicalLaneLean.PrincipalAgentAnalyticProof

namespace HautevilleHouse
namespace ContractTheoryMoralHazardAdverseTheoremCanonicalLaneLean

structure HiddenActionEvidenceTerms {H : HiddenActionPackage} (C : HiddenActionAnalyticCertificate H) where
  effortChoiceSpace : C.effortChoiceSpace
  outputDistribution : C.outputDistribution
  contractMapping : C.contractMapping
  moralHazardConstraint : C.moralHazardConstraint
  hiddenActionClosed : HiddenActionClosed H

def HiddenActionAnalyticCertificate.evidenceTerms {H : HiddenActionPackage}
    (C : HiddenActionAnalyticCertificate H) : HiddenActionEvidenceTerms C :=
  {
    effortChoiceSpace := C.effortChoiceSpaceClosed
    outputDistribution := C.outputDistributionClosed
    contractMapping := C.contractMappingClosed
    moralHazardConstraint := C.moralHazardConstraintClosed
    hiddenActionClosed := hidden_action_closed_from_evidence H C.hiddenActionEvidence
  }

structure AdverseSelectionEvidenceTerms {H : HiddenActionPackage} {A : AdverseSelectionPackage H}
    (C : AdverseSelectionAnalyticCertificate A) where
  agentTypeSpace : C.agentTypeSpace
  contractOfferMenu : C.contractOfferMenu
  screeningMechanism : C.screeningMechanism
  incentiveCompatibility : C.incentiveCompatibility
  participationConstraint : C.participationConstraint
  adverseSelectionClosed : AdverseSelectionClosed A

def AdverseSelectionAnalyticCertificate.evidenceTerms {H : HiddenActionPackage} {A : AdverseSelectionPackage H}
    (C : AdverseSelectionAnalyticCertificate A) : AdverseSelectionEvidenceTerms C :=
  {
    agentTypeSpace := C.agentTypeSpaceClosed
    contractOfferMenu := C.contractOfferMenuClosed
    screeningMechanism := C.screeningMechanismClosed
    incentiveCompatibility := C.incentiveCompatibilityClosed
    participationConstraint := C.participationConstraintClosed
    adverseSelectionClosed := adverse_selection_closed_from_evidence A C.adverseSelectionEvidence
  }

end ContractTheoryMoralHazardAdverseTheoremCanonicalLaneLean
end HautevilleHouse