module Luhistin
  module TextDistorter
    class SprinkleSpecialChars < CurveDistorter
      include CharacterSprinkler
      
      def distort(text, curve)
        super

        sprinkle_chars(text, "!€%&/£$∞§|°§".chars)
      end
    end
  end
end
