module Luhistin
  module TextDistorter
    class BlowSpacesToText < Skeleton
      include CharacterSprinkler
      def distort(text, curve)
        super

        sprinke_chars(text, [" ", "  ", "   ", "    "])
      end
    end
  end
end
