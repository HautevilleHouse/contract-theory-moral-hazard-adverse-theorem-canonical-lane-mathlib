import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContractTheoryMoralHazardAdverseTheoremCanonicalLaneLean

structure MoralHazardProofPackage {M : PrincipalAgentModel} {C : HiddenActionContract} where
  firstBestBenchmark : Prop
  secondBestOptimization : Prop
  incentiveCompatibilityDerived : Prop
  efficiencyTradeoff : Prop
  firstBestBenchmarkTerm : firstBestBenchmark
  secondBestOptimizationTerm : secondBestOptimization
  incentiveCompatibilityDerivedTerm : incentiveCompatibilityDerived
  efficiencyTradeoffTerm : efficiencyTradeoff

structure MoralHazardProofEvidence {M : PrincipalAgentModel} {C : HiddenActionContract} (P : MoralHazardProofPackage M C) where
  firstBestBenchmarkClosed : P.firstBestBenchmark
  secondBestOptimizationClosed : P.secondBestOptimization
  incentiveCompatibilityDerivedClosed : P.incentiveCompatibilityDerived
  efficiencyTradeoffClosed : P.efficiencyTradeoff

def MoralHazardProofClosed {M : PrincipalAgentModel} {C : HiddenActionContract} (P : MoralHazardProofPackage M C) : Prop :=
  P.firstBestBenchmark ∧ P.secondBestOptimization ∧ P.incentiveCompatibilityDerived ∧ P.efficiencyTradeoff

theorem moral_hazard_proof_closed_from_evidence {M : PrincipalAgentModel} {C : HiddenActionContract} (P : MoralHazardProofPackage M C) (E : MoralHazardProofEvidence P) :
  MoralHazardProofClosed P := by
  exact And.intro E.firstBestBenchmarkClosed (And.intro E.secondBestOptimizationClosed (And.intro E.incentiveCompatibilityDerivedClosed E.efficiencyTradeoffClosed))

end ContractTheoryMoralHazardAdverseTheoremCanonicalLaneLean
end HautevilleHouse