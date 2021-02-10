module Luhistin
  module TextDistorter
    class SprinkleNumbers < Skeleton
      include CharacterSprinkler

      def distort(text, curve)
        super

        sprinke_chars(text, "0123456789".chars)
      end
    end
  end
end
