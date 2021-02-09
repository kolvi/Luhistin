module Luhistin
  module TextDistorter
    class SprinkleSpecialChars < Skeleton

      def distort(text, curve)
      	@curve = curve

        sprinke_chars(text, "!€%&/£$∞§|°§")
      end

    end
  end
end
