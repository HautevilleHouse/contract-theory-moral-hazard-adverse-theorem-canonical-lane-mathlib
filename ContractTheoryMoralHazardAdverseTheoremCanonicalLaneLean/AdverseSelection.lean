import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContractTheoryMoralHazardAdverseTheoremCanonicalLaneLean

structure AdverseSelectionModel where
  typeSpace : Type u
  contractSpace : Type v
  agentPrivateInformation : Type w
  screeningConstraint : Prop
  separationCondition : Prop
  adverseSelectionEquilibrium : Prop
  screeningConstraintTerm : screeningConstraint
  separationConditionTerm : separationCondition
  adverseSelectionEquilibriumTerm : adverseSelectionEquilibrium

structure AdverseSelectionEvidence (A : AdverseSelectionModel) where
  screeningConstraintClosed : A.screeningConstraint
  separationConditionClosed : A.separationCondition
  adverseSelectionEquilibriumClosed : A.adverseSelectionEquilibrium

def AdverseSelectionClosed (A : AdverseSelectionModel) : Prop :=
  A.screeningConstraint ∧ A.separationCondition ∧ A.adverseSelectionEquilibrium

theorem adverse_selection_closed_from_evidence (A : AdverseSelectionModel) (E : AdverseSelectionEvidence A) :
  AdverseSelectionClosed A := by
  exact And.intro E.screeningConstraintClosed (And.intro E.separationConditionClosed E.adverseSelectionEquilibriumClosed)

end ContractTheoryMoralHazardAdverseTheoremCanonicalLaneLean
end HautevilleHouse