module Luhistin
  module TextDistorter
    class RemoveSpaces < Skeleton

      def distort(text, curve)
        @curve = curve

      	remove_chars " ", text
      end

    end
  end
end

