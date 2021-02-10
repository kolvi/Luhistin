module Luhistin
  module TextDistorter
    class RemoveSpaces < Skeleton
      def distort(text, curve)
        super

        remove_chars " ", text
      end
    end
  end
end
