import CategoryTheoryToposTheoryCanonicalLaneLean.TheoremStatement
import CanonicalLaneMathlibCore
import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace CategoryTheoryToposTheoryCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure ToposSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure ToposAdmittedObject where
  space : ToposSpace
  toposProperties : Prop
  sheafCondition : Prop
  grothendieckTopology : Type
  grothendieckTopologyStructure : Prop
  conclusion : grothendieckTopologyStructure

structure ToposEndgameState where
  object : ToposAdmittedObject

def ToposWitnessClosed (O : ToposAdmittedObject) : Prop :=
  O.grothendieckTopologyStructure

end CategoryTheoryToposTheoryCanonicalLaneLean
end HautevilleHouse