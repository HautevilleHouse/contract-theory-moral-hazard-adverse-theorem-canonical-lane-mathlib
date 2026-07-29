import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContractTheoryMoralHazardAdverseTheoremCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure ContractSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure ContractAdmittedObject where
  space : ContractSpace
  hiddenAction : Prop
  adverseSelection : Prop
  moralHazard : Prop
  principalAgentModel : Type
  contractStructure : TopologicalSpace principalAgentModel
  incentiveCompatible : Prop
  conclusion : incentiveCompatible

structure ContractEndgameState where
  object : ContractAdmittedObject

def ContractWitnessClosed (O : ContractAdmittedObject) : Prop :=
  O.incentiveCompatible

end ContractTheoryMoralHazardAdverseTheoremCanonicalLaneLean
end HautevilleHouse