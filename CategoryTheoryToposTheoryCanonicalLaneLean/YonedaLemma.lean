import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryToposTheoryCanonicalLaneLean

structure FunctorCategory where
  sourceCategory : Type u
  targetCategory : Type v
  objects : Type w
  morphisms : Type x
  compositionLaw : Prop
  identityLaw : Prop
  compositionLawTerm : compositionLaw
  identityLawTerm : identityLaw

structure NaturalTransformation (F G : FunctorCategory) where
  component : F.objects → G.objects
  naturality : Prop
  naturalityTerm : naturality

structure YonedaLemmaPackage (F : FunctorCategory) where
  functor : F
  object : F.objects
  yonedaEmbedding : Type u
  yonedaLemmaStatement : Prop
  yonedaLemmaProof : yonedaLemmaStatement

def YonedaLemmaClosed (F : FunctorCategory) (Y : YonedaLemmaPackage F) : Prop :=
  Y.yonedaLemmaStatement

end HautevilleHouse
end CategoryTheoryToposTheoryCanonicalLaneLean
