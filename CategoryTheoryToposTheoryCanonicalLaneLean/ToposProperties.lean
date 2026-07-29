import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryToposTheoryCanonicalLaneLean

structure ToposPropertiesPackage where
  hasFiniteLimits : Prop
  hasFiniteColimits : Prop
  hasExponentials : Prop
  hasSubobjectClassifier : Prop
  cartesianClosed : Prop
  GrothendieckTopology : Prop
  sheafCondition : Prop

structure ToposPropertiesEvidence (T : ToposPropertiesPackage) where
  hasFiniteLimitsClosed : T.hasFiniteLimits
  hasFiniteColimitsClosed : T.hasFiniteColimits
  hasExponentialsClosed : T.hasExponentials
  hasSubobjectClassifierClosed : T.hasSubobjectClassifier
  cartesianClosedClosed : T.cartesianClosed
  GrothendieckTopologyClosed : T.GrothendieckTopology
  sheafConditionClosed : T.sheafCondition

def ToposPropertiesClosed (T : ToposPropertiesPackage) : Prop :=
  T.hasFiniteLimits ∧ T.hasFiniteColimits ∧ T.hasExponentials ∧ T.hasSubobjectClassifier ∧
  T.cartesianClosed ∧ T.GrothendieckTopology ∧ T.sheafCondition

theorem topos_properties_closed_from_evidence (T : ToposPropertiesPackage) (E : ToposPropertiesEvidence T) :
    ToposPropertiesClosed T := by
  exact And.intro E.hasFiniteLimitsClosed (And.intro E.hasFiniteColimitsClosed
    (And.intro E.hasExponentialsClosed (And.intro E.hasSubobjectClassifierClosed
      (And.intro E.cartesianClosedClosed (And.intro E.GrothendieckTopologyClosed E.sheafConditionClosed)))))

end CategoryTheoryToposTheoryCanonicalLaneLean
end HautevilleHouse