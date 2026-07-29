import HautevilleHouse.CategoryTheoryToposTheoryCanonicalLaneLean.ToposAdmittedObject
import Mathlib.CategoryTheory.Yoneda

/-!
# Yoneda Embedding Package
-/

namespace HautevilleHouse
namespace CategoryTheoryToposTheoryCanonicalLaneLean

structure YonedaEmbeddingPackage (C : ToposAdmittedObject) where
  presheafCategory : Type u
  yonedaFunctorFullFaithful : Prop
  representableFunctors : Prop
  denseEmbedding : Prop

structure YonedaEmbeddingEvidence (C : ToposAdmittedObject) (Y : YonedaEmbeddingPackage C) where
  yonedaFullFaithfulClosed : Y.yonedaFunctorFullFaithful
  representableClosed : Y.representableFunctors
  denseEmbeddingClosed : Y.denseEmbedding

def YonedaEmbeddingClosed (C : ToposAdmittedObject) (Y : YonedaEmbeddingPackage C) : Prop :=
  Y.yonedaFunctorFullFaithful ∧ Y.representableFunctors ∧ Y.denseEmbedding

theorem yoneda_embedding_closed_from_evidence (C : ToposAdmittedObject) (Y : YonedaEmbeddingPackage C)
    (E : YonedaEmbeddingEvidence C Y) : YonedaEmbeddingClosed C Y := by
  exact And.intro E.yonedaFullFaithfulClosed (And.intro E.representableClosed E.denseEmbeddingClosed)

end CategoryTheoryToposTheoryCanonicalLaneLean
end HautevilleHouse