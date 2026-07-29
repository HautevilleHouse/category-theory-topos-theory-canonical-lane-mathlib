import HautevilleHouse.CategoryTheoryToposTheoryCanonicalLaneLean.LimitsAndColimits

namespace HautevilleHouse
namespace CategoryTheoryToposTheoryCanonicalLaneLean

structure SheafPackage (Y : YonedaLemmaPackage) (A : AdjunctionPackage Y) (L : LimitsPackage Y A) where
  site : Type u
  coveringFamilies : Prop
  sheafCondition : Prop
  toposProperties : Prop
  giraudAxioms : Prop

structure SheafEvidence {Y : YonedaLemmaPackage} {A : AdjunctionPackage Y} {L : LimitsPackage Y A} (S : SheafPackage Y A L) where
  sheafConditionClosed : S.sheafCondition
  toposPropertiesClosed : S.toposProperties
  giraudAxiomsClosed : S.giraudAxioms

def SheafClosed {Y : YonedaLemmaPackage} {A : AdjunctionPackage Y} {L : LimitsPackage Y A} (S : SheafPackage Y A L) : Prop :=
  S.sheafCondition ∧ S.toposProperties ∧ S.giraudAxioms

theorem sheaf_closed_from_evidence {Y : YonedaLemmaPackage} {A : AdjunctionPackage Y} {L : LimitsPackage Y A} (S : SheafPackage Y A L) (E : SheafEvidence S) :
    SheafClosed S := by
  exact And.intro E.sheafConditionClosed
    (And.intro E.toposPropertiesClosed E.giraudAxiomsClosed)

end CategoryTheoryToposTheoryCanonicalLaneLean
end HautevilleHouse