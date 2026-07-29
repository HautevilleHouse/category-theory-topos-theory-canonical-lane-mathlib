import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryToposTheoryCanonicalLaneLean

def ConstrainedToposClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_topos_endgame (A : AdmissibleClass) :
    ConstrainedToposClosure A :=
  And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end CategoryTheoryToposTheoryCanonicalLaneLean
end HautevilleHouse