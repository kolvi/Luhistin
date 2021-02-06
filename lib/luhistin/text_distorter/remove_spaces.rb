module Luhistin
  module TextDistorter
    class RemoveSpaces < Skeleton

      def distort(text, curve)
      	remove_chars " ", text, curve
      end

    end
  end
end

