import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryToposTheoryCanonicalLaneLean

structure SheafificationPackage {C : CategoryPackage} (T : ToposPackage C) (J : GrothendieckTopology C) where
  sheaf : Presheaf C → Sheaf J
  universalProperty : ∀ (F : Presheaf C) (G : Sheaf J), Hom(F, Forget G) ≃ Hom(Sheafify F, G)
  proofTerm : universalProperty

structure SheafificationEvidence {C : CategoryPackage} {T : ToposPackage C} {J : GrothendieckTopology C}
    (S : SheafificationPackage C T J) where
  universalPropertyClosed : S.universalProperty

def SheafificationClosed {C : CategoryPackage} {T : ToposPackage C} {J : GrothendieckTopology C}
    (S : SheafificationPackage C T J) : Prop :=
  S.universalProperty

theorem sheafification_closed_from_evidence {C : CategoryPackage} {T : ToposPackage C} {J : GrothendieckTopology C}
    (S : SheafificationPackage C T J) (E : SheafificationEvidence C T J S) : SheafificationClosed S := by
  exact E.universalPropertyClosed

end CategoryTheoryToposTheoryCanonicalLaneLean
end HautevilleHouse
