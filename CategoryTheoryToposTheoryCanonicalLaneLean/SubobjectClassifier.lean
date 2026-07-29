import HautevilleHouse.CategoryTheoryToposTheoryCanonicalLaneLean.ToposAdmittedObject
import Mathlib.CategoryTheory.Subobject

/-!
# Subobject Classifier Package
-/

namespace HautevilleHouse
namespace CategoryTheoryToposTheoryCanonicalLaneLean

structure SubobjectClassifierPackage (C : ToposAdmittedObject) where
  classifierObject : Type u
  truthMorphism : Type u
  characteristicMorphism : Type u
  pullbackSquare : Prop
  uniqueness : Prop

structure SubobjectClassifierEvidence (C : ToposAdmittedObject) (S : SubobjectClassifierPackage C) where
  pullbackSquareClosed : S.pullbackSquare
  uniquenessClosed : S.uniqueness

def SubobjectClassifierClosed (C : ToposAdmittedObject) (S : SubobjectClassifierPackage C) : Prop :=
  S.pullbackSquare ∧ S.uniqueness

theorem subobject_classifier_closed_from_evidence (C : ToposAdmittedObject) (S : SubobjectClassifierPackage C)
    (E : SubobjectClassifierEvidence C S) : SubobjectClassifierClosed C S := by
  exact And.intro E.pullbackSquareClosed E.uniquenessClosed

end CategoryTheoryToposTheoryCanonicalLaneLean
end HautevilleHouse