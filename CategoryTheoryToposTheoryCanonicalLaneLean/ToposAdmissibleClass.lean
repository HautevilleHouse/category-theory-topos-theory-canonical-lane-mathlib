import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryToposTheoryCanonicalLaneLean

structure ToposObject where
  carrier : Type u
  category : Category carrier
  toposProperty : Prop

def toposObjectConclusion (O : ToposObject) : Prop :=
  O.toposProperty

structure AdmissibleClass where
  object : ToposObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  toposObjectConclusion A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end CategoryTheoryToposTheoryCanonicalLaneLean
end HautevilleHouse