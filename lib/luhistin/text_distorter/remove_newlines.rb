module Luhistin
  module TextDistorter
    class RemoveNewlines < Skeleton

      def distort(text, curve)
        @curve = curve

      	remove_chars "\n", text
      end

    end
  end
end