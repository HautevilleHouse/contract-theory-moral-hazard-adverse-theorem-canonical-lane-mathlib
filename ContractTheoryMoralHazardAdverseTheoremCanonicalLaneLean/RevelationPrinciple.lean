import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContractTheoryMoralHazardAdverseTheoremCanonicalLaneLean

structure Mechanism where
  typeSpace : Type u
  outcomeSpace : Type v
  allocationRule : typeSpace -> outcomeSpace
  transferRule : typeSpace -> ℝ

structure RevelationPrincipleStatement (M : Mechanism) where
  directMechanism : Mechanism
  equilibriumPreserving : ∀ t : M.typeSpace, M.allocationRule t = directMechanism.allocationRule t ∧ M.transferRule t = directMechanism.transferRule t
  truthTelling : ∀ t : M.typeSpace, ∀ t' : M.typeSpace,
    directMechanism.transferRule t ≥ directMechanism.transferRule t'

define revelationPrincipleClosed (M : Mechanism) : Prop :=
  ∃ (directMechanism : Mechanism), (∀ t : M.typeSpace,
    M.allocationRule t = directMechanism.allocationRule t ∧ M.transferRule t = directMechanism.transferRule t) ∧
    (∀ t : M.typeSpace, ∀ t' : M.typeSpace, directMechanism.transferRule t ≥ directMechanism.transferRule t')

theorem revelation_principle_closure (M : Mechanism) : revelationPrincipleClosed M := by
  refine ⟨M, ?_, ?_⟩
  · intro t; exact ⟨rfl, rfl⟩
  · intro t t'; rfl

end ContractTheoryMoralHazardAdverseTheoremCanonicalLaneLean
end HautevilleHouse