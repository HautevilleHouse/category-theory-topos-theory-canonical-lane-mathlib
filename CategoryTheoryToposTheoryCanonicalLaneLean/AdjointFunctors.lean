import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryToposTheoryCanonicalLaneLean

structure AdjointPackage (C D : CategoryPackage) (F : FunctorPackage C D) (G : FunctorPackage D C) where
  unit : NaturalTransformationPackage C C (functor_id C) (G.comp F)
  counit : NaturalTransformationPackage D D (F.comp G) (functor_id D)
  triangleLeft : ∀ X : C.Obj, D.comp (F.homMap (unit.components X)) (counit.components (F.objMap X)) = D.id (F.objMap X)
  triangleRight : ∀ Y : D.Obj, C.comp (unit.components (G.objMap Y)) (G.homMap (counit.components Y)) = C.id (G.objMap Y)

def AdjointClosed (C D : CategoryPackage) (F : FunctorPackage C D) (G : FunctorPackage D C)
    (A : AdjointPackage C D F G) : Prop :=
  True

-- Helper: identity functor and composition

def functor_id (C : CategoryPackage) : FunctorPackage C C :=
  { objMap := λ X => X
  , homMap := λ f => f
  , preservesId := λ _ => rfl
  , preservesComp := λ _ _ => rfl
  }

def functor_comp (C D E : CategoryPackage) (F : FunctorPackage C D) (G : FunctorPackage D E) : FunctorPackage C E :=
  { objMap := λ X => G.objMap (F.objMap X)
  , homMap := λ f => G.homMap (F.homMap f)
  , preservesId := λ X => by
      calc G.homMap (F.homMap (C.id X)) = G.homMap (D.id (F.objMap X)) := by rw [F.preservesId X]
      _ = E.id (G.objMap (F.objMap X)) := by rw [G.preservesId (F.objMap X)]
  , preservesComp := λ f g => by
      calc G.homMap (F.homMap (C.comp f g)) = G.homMap (D.comp (F.homMap f) (F.homMap g)) := by rw [F.preservesComp f g]
      _ = E.comp (G.homMap (F.homMap f)) (G.homMap (F.homMap g)) := by rw [G.preservesComp (F.homMap f) (F.homMap g)]
  }

end CategoryTheoryToposTheoryCanonicalLaneLean
end HautevilleHouse