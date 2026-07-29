import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryToposTheoryCanonicalLaneLean

structure SheafConditionPackage where
  site : Type u
  covering : Type v
  sheafConditionStalk : Prop
  descentCondition : Prop
  sheafificationExists : Prop
  plusConstruction : Prop
  sheafificationAdjunction : Prop

structure SheafConditionEvidence (S : SheafConditionPackage) where
  sheafConditionStalkClosed : S.sheafConditionStalk
  descentConditionClosed : S.descentCondition
  sheafificationExistsClosed : S.sheafificationExists
  plusConstructionClosed : S.plusConstruction
  sheafificationAdjunctionClosed : S.sheafificationAdjunction

def SheafConditionClosed (S : SheafConditionPackage) : Prop :=
  S.sheafConditionStalk ∧ S.descentCondition ∧ S.sheafificationExists ∧ S.plusConstruction ∧ S.sheafificationAdjunction

theorem sheaf_condition_closed_from_evidence (S : SheafConditionPackage) (E : SheafConditionEvidence S) :
    SheafConditionClosed S := by
  exact And.intro E.sheafConditionStalkClosed (And.intro E.descentConditionClosed
    (And.intro E.sheafificationExistsClosed (And.intro E.plusConstructionClosed E.sheafificationAdjunctionClosed)))

end CategoryTheoryToposTheoryCanonicalLaneLean
end HautevilleHouse