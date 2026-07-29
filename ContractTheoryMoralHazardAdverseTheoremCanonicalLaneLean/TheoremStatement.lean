import Mathlib.Data.Set.Basic

namespace HautevilleHouse
namespace ContractTheoryMoralHazardAdverseTheoremCanonicalLaneLean

structure ContractTheorySpace where
  principal : Type
  agent : Type
  actions : Set (agent → Type)
  contracts : Set (principal → agent → Type)
  moralHazard : Prop
  adverseSelection : Prop

structure ContractTheoryAdmittedObject where
  space : ContractTheorySpace
  moralHazard : Prop
  adverseSelection : Prop
  contractExists : Prop
  optimalContract : Prop
  conclusion : optimalContract

def MoralHazardAdverseWitnessClosed (O : ContractTheoryAdmittedObject) : Prop :=
  O.optimalContract

end ContractTheoryMoralHazardAdverseTheoremCanonicalLaneLean
end HautevilleHouse