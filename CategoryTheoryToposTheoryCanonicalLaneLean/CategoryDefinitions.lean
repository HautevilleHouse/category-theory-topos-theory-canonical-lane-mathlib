import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryToposTheoryCanonicalLaneLean

structure CategoryPackage where
  Ob : Type u
  Hom : Ob → Ob → Type v
  id : ∀ X : Ob, Hom X X
  comp : ∀ {X Y Z : Ob}, Hom X Y → Hom Y Z → Hom X Z
  idComp : ∀ {X Y : Ob} (f : Hom X Y), comp (id X) f = f
  compId : ∀ {X Y : Ob} (f : Hom X Y), comp f (id Y) = f
  assoc : ∀ {W X Y Z : Ob} (f : Hom W X) (g : Hom X Y) (h : Hom Y Z),
          comp (comp f g) h = comp f (comp g h)

def CategoryClosed (C : CategoryPackage) : Prop :=
  True

structure FunctorPackage (C D : CategoryPackage) where
  objMap : C.Ob → D.Ob
  homMap : ∀ {X Y : C.Ob}, C.Hom X Y → D.Hom (objMap X) (objMap Y)
  preservesId : ∀ X : C.Ob, homMap (C.id X) = D.id (objMap X)
  preservesComp : ∀ {X Y Z : C.Ob} (f : C.Hom X Y) (g : C.Hom Y Z),
                  homMap (C.comp f g) = D.comp (homMap f) (homMap g)

def FunctorClosed (F : FunctorPackage C D) : Prop :=
  True

structure NaturalTransformationPackage (C D : CategoryPackage) (F G : FunctorPackage C D) where
  components : ∀ X : C.Ob, D.Hom (F.objMap X) (G.objMap X)
  naturality : ∀ {X Y : C.Ob} (f : C.Hom X Y),
               D.comp (F.homMap f) (components Y) = D.comp (components X) (G.homMap f)

def NaturalTransformationClosed (η : NaturalTransformationPackage C D F G) : Prop :=
  True

end CategoryTheoryToposTheoryCanonicalLaneLean
end HautevilleHouse