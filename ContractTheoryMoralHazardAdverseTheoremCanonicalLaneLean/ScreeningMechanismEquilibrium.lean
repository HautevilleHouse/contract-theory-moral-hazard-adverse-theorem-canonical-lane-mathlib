import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ContractTheoryMoralHazardAdverseTheoremCanonicalLaneLean.AdverseSelectionModel

namespace HautevilleHouse
namespace ContractTheoryMoralHazardAdverseTheoremCanonicalLaneLean

structure ScreeningMechanismEquilibriumPackage (A : AdverseSelectionPackage) where
  equilibriumType : Type u
  truthTellingConstraint : Prop
  incentiveCompatibleAllocation : Prop
  individualRationality : Prop
  budgetBalance : Prop

structure ScreeningMechanismEquilibriumEvidence
    {A : AdverseSelectionPackage}
    (P : ScreeningMechanismEquilibriumPackage A) where
  truthTellingConstraintClosed : P.truthTellingConstraint
  incentiveCompatibleAllocationClosed : P.incentiveCompatibleAllocation
  individualRationalityClosed : P.individualRationality
  budgetBalanceClosed : P.budgetBalance

def ScreeningMechanismEquilibriumClosed
    {A : AdverseSelectionPackage}
    (P : ScreeningMechanismEquilibriumPackage A) : Prop :=
  P.truthTellingConstraint ∧ P.incentiveCompatibleAllocation ∧
  P.individualRationality ∧ P.budgetBalance

theorem screening_mechanism_equilibrium_closed_from_evidence
    {A : AdverseSelectionPackage}
    (P : ScreeningMechanismEquilibriumPackage A)
    (E : ScreeningMechanismEquilibriumEvidence P) :
    ScreeningMechanismEquilibriumClosed P := by
  exact And.intro E.truthTellingConstraintClosed
    (And.intro E.incentiveCompatibleAllocationClosed
      (And.intro E.individualRationalityClosed E.budgetBalanceClosed))

end ContractTheoryMoralHazardAdverseTheoremCanonicalLaneLean
end HautevilleHouse