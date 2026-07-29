import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContractTheoryMoralHazardAdverseTheoremCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  ContractTheoryWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end ContractTheoryMoralHazardAdverseTheoremCanonicalLaneLean
end HautevilleHouse