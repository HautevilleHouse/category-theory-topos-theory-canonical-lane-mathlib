import HautevilleHouse.CategoryTheoryToposTheoryCanonicalLaneLean.FinalTheorem

namespace HautevilleHouse
namespace CategoryTheoryToposTheoryCanonicalLaneLean

structure ToposAdmittedObject where
  toposCategory : Type u
  toposStructure : Type v
  grothendieckToposAxioms : Prop
  sheafificationExists : Prop
  geometricMorphismsDefined : Prop
  conclusion : geometricMorphismsDefined

def ToposWitnessClosed (O : ToposAdmittedObject) : Prop :=
  O.geometricMorphismsDefined

end CategoryTheoryToposTheoryCanonicalLaneLean
end HautevilleHouse