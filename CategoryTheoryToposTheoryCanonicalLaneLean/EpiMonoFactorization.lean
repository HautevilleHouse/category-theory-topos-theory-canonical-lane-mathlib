import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryToposTheoryCanonicalLaneLean

structure Factorization (C : Type u) [Category C] (f : Arrow C) where
  middle : C
  e : f.left ⟶ middle
  m : middle ⟶ f.right
  epi : Epi e
  mono : Mono m
  factor : e ≫ m = f.hom

def ImageFactorization (C : Type u) [Category C] (f : Arrow C) : Prop :=
  ∃ (F : Factorization f), True

end CategoryTheoryToposTheoryCanonicalLaneLean
end HautevilleHouse