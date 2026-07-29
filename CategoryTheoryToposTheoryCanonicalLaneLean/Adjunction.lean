import HautevilleHouse.CategoryTheoryToposTheoryCanonicalLaneLean.YonedaLemma

namespace HautevilleHouse
namespace CategoryTheoryToposTheoryCanonicalLaneLean

structure AdjunctionPackage (Y : YonedaLemmaPackage) where
  leftAdjoint : Type u → Type u
  rightAdjoint : Type u → Type u
  adjunctionIso : Prop
  unitCounitTriangle : Prop
  uniqueness : Prop

structure AdjunctionEvidence {Y : YonedaLemmaPackage} (A : AdjunctionPackage Y) where
  adjunctionIsoClosed : A.adjunctionIso
  unitCounitTriangleClosed : A.unitCounitTriangle
  uniquenessClosed : A.uniqueness

def AdjunctionClosed {Y : YonedaLemmaPackage} (A : AdjunctionPackage Y) : Prop :=
  A.adjunctionIso ∧ A.unitCounitTriangle ∧ A.uniqueness

theorem adjunction_closed_from_evidence {Y : YonedaLemmaPackage} (A : AdjunctionPackage Y) (E : AdjunctionEvidence A) :
    AdjunctionClosed A := by
  exact And.intro E.adjunctionIsoClosed
    (And.intro E.unitCounitTriangleClosed E.uniquenessClosed)

end CategoryTheoryToposTheoryCanonicalLaneLean
end HautevilleHouse