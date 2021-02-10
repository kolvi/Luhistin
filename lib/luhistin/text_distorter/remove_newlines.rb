module Luhistin
  module TextDistorter
    class RemoveNewlines < Skeleton
      def distort(text, curve)
        super

        remove_chars "\n", text
      end
    end
  end
end
