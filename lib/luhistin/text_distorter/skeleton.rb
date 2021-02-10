module Luhistin
  module TextDistorter
    class Skeleton
      include WordTraverser
      include CharacterRemover
      include CharacterSprinkler

      attr_accessor :curve

      def initialize
        @curve = nil
      end

      def distort(text, curve)
      	@curve = Luhistin::PropabilityCurve.new(curve)
      end

      def randomly_selected?(relative_position)
        Random.rand < @curve.propability_reading(relative_position)
      end

    end
  end
end
