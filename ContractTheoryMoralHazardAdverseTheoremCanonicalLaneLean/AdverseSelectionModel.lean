import ContractTheoryMoralHazardAdverseTheoremCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace ContractTheoryMoralHazardAdverseTheoremCanonicalLaneLean

struct AdverseSelectionModel where
  typeSpace : Type u
  agentTypes : Set typeSpace
  utilityAgent : typeSpace → ℝ
  utilityPrincipal : typeSpace → ℝ
  screeningContract : Prop
  separationCondition : Prop
  poolingEquilibrium : Prop

def ScreeningContractClosed (M : AdverseSelectionModel) : Prop :=
  M.screeningContract

end ContractTheoryMoralHazardAdverseTheoremCanonicalLaneLean
end HautevilleHouse