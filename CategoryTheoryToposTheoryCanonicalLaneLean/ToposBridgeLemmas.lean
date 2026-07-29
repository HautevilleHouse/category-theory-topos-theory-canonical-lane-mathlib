import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryToposTheoryCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  toposObjectConclusion A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A :=
  A.object.toposProperty

end CategoryTheoryToposTheoryCanonicalLaneLean
end HautevilleHouse