module Luhistin
  module TextDistorter
    class SprinkleNumbers < Skeleton
      def distort(text, curve)
        @curve = curve

        sprinke_chars(text, "0123456789".chars)
      end
    end
  end
end
