import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryToposTheoryCanonicalLaneLean

structure SmallCategory where
  objects : Type u
  morphisms : objects → objects → Type v
  identity : ∀ X : objects, morphisms X X
  composition : ∀ X Y Z : objects, morphisms X Y → morphisms Y Z → morphisms X Z
  assocLaw : Prop
  idLaw : Prop
  assocLawTerm : assocLaw
  idLawTerm : idLaw

structure LimitPackage (J : SmallCategory) (C : Category) (D : Functor J C) where
  coneObject : C.objects
  coneMorphisms : ∀ X : J.objects, C.morphisms coneObject (D.objectMap X)
  universalProperty : Prop
  limitExists : Prop
  limitProof : limitExists
  universalPropertyTerm : universalProperty

def LimitClosed (J : SmallCategory) (C : Category) (D : Functor J C) (L : LimitPackage J C D) : Prop :=
  L.limitExists

structure ColimitPackage (J : SmallCategory) (C : Category) (D : Functor J C) where
  coconeObject : C.objects
  coconeMorphisms : ∀ X : J.objects, C.morphisms (D.objectMap X) coconeObject
  universalProperty : Prop
  colimitExists : Prop
  colimitProof : colimitExists
  universalPropertyTerm : universalProperty

def ColimitClosed (J : SmallCategory) (C : Category) (D : Functor J C) (Col : ColimitPackage J C D) : Prop :=
  Col.colimitExists

end HautevilleHouse
end CategoryTheoryToposTheoryCanonicalLaneLean
