import ContractTheoryMoralHazardAdverseTheoremCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace ContractTheoryMoralHazardAdverseTheoremCanonicalLaneLean

def ConstrainedMoralHazardAdverseClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_moral_hazard_adverse_endgame (A : AdmissibleClass) :
    ConstrainedMoralHazardAdverseClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end ContractTheoryMoralHazardAdverseTheoremCanonicalLaneLean
end HautevilleHouse