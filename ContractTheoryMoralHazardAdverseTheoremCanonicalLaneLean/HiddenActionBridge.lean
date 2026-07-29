import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContractTheoryMoralHazardAdverseTheoremCanonicalLaneLean

structure HiddenActionModel where
  effortSpace : Type u
  outputSpace : Type v
  costFunction : effortSpace -> ℝ
  utilityAgent : effortSpace -> outputSpace -> ℝ
  utilityPrincipal : outputSpace -> ℝ

define hiddenActionBridgeClosed (M : HiddenActionModel) : Prop :=
  (∀ e : M.effortSpace, M.costFunction e ≥ 0) ∧
  (∀ e : M.effortSpace, ∃ o : M.outputSpace, M.utilityPrincipal o ≥ 0) ∧
  (∀ e1 e2 : M.effortSpace, (∀ o : M.outputSpace, M.utilityAgent e1 o ≥ M.utilityAgent e2 o) → M.costFunction e1 ≥ M.costFunction e2)

theorem hidden_action_bridge_closed (M : HiddenActionModel) : hiddenActionBridgeClosed M := by
  refine ⟨?_, ?_, ?_⟩
  · exact fun e => by positivity
  · intro e; exact ⟨default, by positivity⟩
  · intro e1 e2 h; exact by
    have : M.utilityAgent e1 (default : M.outputSpace) ≥ M.utilityAgent e2 (default : M.outputSpace) :=
      h (default : M.outputSpace)
    positivity

end ContractTheoryMoralHazardAdverseTheoremCanonicalLaneLean
end HautevilleHouse