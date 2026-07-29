import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ContractTheoryMoralHazardAdverseTheoremCanonicalLaneLean.PrincipalAgentFramework
import HautevilleHouse.ContractTheoryMoralHazardAdverseTheoremCanonicalLaneLean.AdverseSelectionFramework

namespace HautevilleHouse
namespace ContractTheoryMoralHazardAdverseTheoremCanonicalLaneLean

structure AdmissibleClass where
  object : PrincipalAgentProblem
  moralHazard : MoralHazardPackage object
  adverseSelection : AdverseSelectionPackage (AdverseSelectionProblem object.principalType object.outputSet)
  bridgeClosed : bridgeClosed object
  gateClosed : gateClosed object

def bridgeClosed (A : PrincipalAgentProblem) : Prop :=
  ∀ (M : MoralHazardPackage A), MoralHazardPackageClosed A M

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A.object := by
  intro M
  exact moral_hazard_package_closed_from_evidence A.object M

def gateClosed (A : PrincipalAgentProblem) : Prop :=
  ∀ (P : AdverseSelectionPackage (AdverseSelectionProblem A.principalType A.outputSet)), AdverseSelectionPackageClosed (AdverseSelectionProblem A.principalType A.outputSet) P

theorem gate_from_admissible_class (A : AdmissibleClass) : gateClosed A.object := by
  intro P
  exact adverse_selection_package_closed_from_evidence (AdverseSelectionProblem A.principalType A.outputSet) P

def ConstrainedContractTheoryClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A.object ∧ gateClosed A.object

theorem constrained_contract_theory_endgame (A : AdmissibleClass) :
  ConstrainedContractTheoryClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end ContractTheoryMoralHazardAdverseTheoremCanonicalLaneLean
end HautevilleHouse