module Luhistin
  module TextDistorter
    class BlowSpacesToText < Skeleton
      def distort(text, curve)
        @curve = curve

        sprinke_chars(text, [" ", "  ", "   ", "    "])
      end
    end
  end
end
