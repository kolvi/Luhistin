module Luhistin
  module TextDistorter
    class SprinkleNumbers < CurveDistorter
      include CharacterSprinkler

      def distort(text, curve)
        super

        sprinkle_chars(text, "0123456789".chars)
      end
    end
  end
end
