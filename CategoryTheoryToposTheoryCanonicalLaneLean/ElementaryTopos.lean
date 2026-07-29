import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryToposTheoryCanonicalLaneLean

structure ElementaryToposPackage where
  finiteLimits : Prop
  cartesianClosed : Prop
  subobjectClassifier : Prop
  powerObject : Prop
  exponentiation : Prop

structure ElementaryToposEvidence (E : ElementaryToposPackage) where
  finiteLimitsClosed : E.finiteLimits
  cartesianClosedClosed : E.cartesianClosed
  subobjectClassifierClosed : E.subobjectClassifier
  powerObjectClosed : E.powerObject
  exponentiationClosed : E.exponentiation

def ElementaryToposClosed (E : ElementaryToposPackage) : Prop :=
  E.finiteLimits ∧ E.cartesianClosed ∧ E.subobjectClassifier ∧ E.powerObject ∧ E.exponentiation

theorem elementary_topos_closed_from_evidence (E : ElementaryToposPackage) (Ev : ElementaryToposEvidence E) : ElementaryToposClosed E := by
  exact And.intro Ev.finiteLimitsClosed (And.intro Ev.cartesianClosedClosed (And.intro Ev.subobjectClassifierClosed (And.intro Ev.powerObjectClosed Ev.exponentiationClosed)))

end CategoryTheoryToposTheoryCanonicalLaneLean
end HautevilleHouse
