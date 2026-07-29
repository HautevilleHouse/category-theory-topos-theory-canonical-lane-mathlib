import HautevilleHouse.CategoryTheoryToposTheoryCanonicalLaneLean.Adjunction

namespace HautevilleHouse
namespace CategoryTheoryToposTheoryCanonicalLaneLean

structure LimitsPackage (Y : YonedaLemmaPackage) (A : AdjunctionPackage Y) where
  coneCategory : Type u
  limitExistence : Prop
  colimitExistence : Prop
  limitUniversality : Prop
  colimitUniversality : Prop

structure LimitsEvidence {Y : YonedaLemmaPackage} {A : AdjunctionPackage Y} (L : LimitsPackage Y A) where
  limitExistenceClosed : L.limitExistence
  colimitExistenceClosed : L.colimitExistence
  limitUniversalityClosed : L.limitUniversality
  colimitUniversalityClosed : L.colimitUniversality

def LimitsClosed {Y : YonedaLemmaPackage} {A : AdjunctionPackage Y} (L : LimitsPackage Y A) : Prop :=
  L.limitExistence ∧ L.colimitExistence ∧ L.limitUniversality ∧ L.colimitUniversality

theorem limits_closed_from_evidence {Y : YonedaLemmaPackage} {A : AdjunctionPackage Y} (L : LimitsPackage Y A) (E : LimitsEvidence L) :
    LimitsClosed L := by
  exact And.intro E.limitExistenceClosed
    (And.intro E.colimitExistenceClosed
      (And.intro E.limitUniversalityClosed E.colimitUniversalityClosed))

end CategoryTheoryToposTheoryCanonicalLaneLean
end HautevilleHouse