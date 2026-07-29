import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryToposTheoryCanonicalLaneLean

structure CategoryPackage where
  objects : Type u
  morphisms : objects → objects → Type v
  identity : ∀ (A : objects), morphisms A A
  composition : ∀ {A B C : objects}, morphisms A B → morphisms B C → morphisms A C
  identityLeft : ∀ {A B : objects} (f : morphisms A B), composition (identity A) f = f
  identityRight : ∀ {A B : objects} (f : morphisms A B), composition f (identity B) = f
  associativity : ∀ {A B C D : objects} (f : morphisms A B) (g : morphisms B C) (h : morphisms C D),
    composition (composition f g) h = composition f (composition g h)

structure FunctorPackage (C D : CategoryPackage) where
  mapObjects : C.objects → D.objects
  mapMorphisms : ∀ {A B : C.objects}, C.morphisms A B → D.morphisms (mapObjects A) (mapObjects B)
  preservesIdentity : ∀ (A : C.objects), mapMorphisms (C.identity A) = D.identity (mapObjects A)
  preservesComposition : ∀ {A B C : C.objects} (f : C.morphisms A B) (g : C.morphisms B C),
    mapMorphisms (C.composition f g) = D.composition (mapMorphisms f) (mapMorphisms g)

structure ToposPackage (C : CategoryPackage) where
  limitExistence : Prop
  colimitExistence : Prop
  subobjectClassifier : Prop
  exponentiation : Prop
  finiteLimits : Prop
  finiteColimits : Prop

structure ToposEvidence (C : CategoryPackage) (T : ToposPackage C) where
  limitExistenceClosed : T.limitExistence
  colimitExistenceClosed : T.colimitExistence
  subobjectClassifierClosed : T.subobjectClassifier
  exponentiationClosed : T.exponentiation
  finiteLimitsClosed : T.finiteLimits
  finiteColimitsClosed : T.finiteColimits

def ToposClosed {C : CategoryPackage} (T : ToposPackage C) : Prop :=
  T.limitExistence ∧ T.colimitExistence ∧ T.subobjectClassifier ∧
  T.exponentiation ∧ T.finiteLimits ∧ T.finiteColimits

theorem topos_closed_from_evidence {C : CategoryPackage} (T : ToposPackage C) (E : ToposEvidence C T) :
    ToposClosed T := by
  exact And.intro E.limitExistenceClosed
    (And.intro E.colimitExistenceClosed
      (And.intro E.subobjectClassifierClosed
        (And.intro E.exponentiationClosed
          (And.intro E.finiteLimitsClosed E.finiteColimitsClosed))))

structure ToposAdmittedObject where
  category : CategoryPackage
  topos : ToposPackage category
  toposEvidence : ToposEvidence category topos
  conclusion : ToposClosed topos

def ToposWitnessClosed (O : ToposAdmittedObject) : Prop :=
  O.conclusion

end CategoryTheoryToposTheoryCanonicalLaneLean
end HautevilleHouse
