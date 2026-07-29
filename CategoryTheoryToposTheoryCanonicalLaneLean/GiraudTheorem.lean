import CategoryTheoryToposTheoryCanonicalLaneLean.AdjointFunctorTheorem

namespace HautevilleHouse
namespace CategoryTheoryToposTheoryCanonicalLaneLean

structure GiraudTheoremPackage where
  category : Type u
  grothendieckTopology : Type v
  sheaves : Type w
  toposProperties : Prop
  exactness : Prop
  colimitCompleteness : Prop

def GiraudTheoremClosed (G : GiraudTheoremPackage) : Prop :=
  G.toposProperties ∧ G.exactness ∧ G.colimitCompleteness

structure GiraudTheoremEvidence (G : GiraudTheoremPackage) where
  toposPropertiesClosed : G.toposProperties
  exactnessClosed : G.exactness
  colimitCompletenessClosed : G.colimitCompleteness

theorem giraud_theorem_closed_from_evidence (G : GiraudTheoremPackage)
    (E : GiraudTheoremEvidence G) : GiraudTheoremClosed G := by
  exact And.intro E.toposPropertiesClosed
    (And.intro E.exactnessClosed E.colimitCompletenessClosed)

end CategoryTheoryToposTheoryCanonicalLaneLean
end HautevilleHouse