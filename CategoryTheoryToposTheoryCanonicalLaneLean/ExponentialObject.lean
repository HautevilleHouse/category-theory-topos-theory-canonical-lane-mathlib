import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryToposTheoryCanonicalLaneLean

structure Exponential (C : Type u) [Category C] [HasBinaryProducts C] (B A : C) where
  B^A : C
  eval : (B^A ⨯ A) ⟶ B
  currying : ∀ (X : C) (f : X ⨯ A ⟶ B), ∃! (g : X ⟶ B^A), (g ⊗ 𝟙 A) ≫ eval = f

def CartesianClosed (C : Type u) [Category C] [HasBinaryProducts C] : Prop :=
  ∀ (A B : C), Nonempty (Exponential C B A)

end CategoryTheoryToposTheoryCanonicalLaneLean
end HautevilleHouse