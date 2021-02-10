module Luhistin
  module TextDistorter
    class SprinkleSpecialChars < Skeleton
      def distort(text, curve)
        super

        sprinke_chars(text, "!€%&/£$∞§|°§".chars)
      end
    end
  end
end
