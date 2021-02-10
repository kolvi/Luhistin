module Luhistin
  module TextDistorter
    class BlowSpacesToText < Skeleton
      def distort(text, curve)
        super

        sprinke_chars(text, [" ", "  ", "   ", "    "])
      end
    end
  end
end
