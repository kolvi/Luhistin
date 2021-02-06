module Luhistin
  module TextDistorter
    class RemoveNewlines < Skeleton

      def distort(text, curve)
      	remove_chars "\n", text, curve
      end

    end
  end
end