import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryToposTheoryCanonicalLaneLean

structure Category where
  objects : Type u
  morphisms : objects → objects → Type v
  identity : ∀ X : objects, morphisms X X
  composition : ∀ X Y Z : objects, morphisms X Y → morphisms Y Z → morphisms X Z
  associativity : Prop
  identityLaw : Prop
  associativityTerm : associativity
  identityLawTerm : identityLaw

structure Functor (C D : Category) where
  objectMap : C.objects → D.objects
  morphismMap : ∀ X Y : C.objects, C.morphisms X Y → D.morphisms (objectMap X) (objectMap Y)
  preservesIdentity : Prop
  preservesComposition : Prop
  preservesIdentityTerm : preservesIdentity
  preservesCompositionTerm : preservesComposition

structure AdjointFunctorPackage (C D : Category) (F : Functor C D) (G : Functor D C) where
  unit : NaturalTransformation (Functor.id C) (Functor.comp G F)
  counit : NaturalTransformation (Functor.comp F G) (Functor.id D)
  triangleIdentities : Prop
  adjointStatement : Prop
  adjointProof : adjointStatement
  triangleIdentitiesTerm : triangleIdentities

def AdjointFunctorClosed (C D : Category) (F : Functor C D) (G : Functor D C) (A : AdjointFunctorPackage C D F G) : Prop :=
  A.adjointStatement

end HautevilleHouse
end CategoryTheoryToposTheoryCanonicalLaneLean
