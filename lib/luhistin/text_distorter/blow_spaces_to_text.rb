module Luhistin
  module TextDistorter
    class BlowSpacesToText < CurveDistorter
      include CharacterSprinkler
      def distort(text, curve)
        super

        sprinkle_chars(text, [" ", "  ", "   ", "    "])
      end
    end
  end
end
