module Luhistin
  module TextDistorter
    class RemoveNewlines < CurveDistorter
      include CharacterRemover

      def distort(text, curve)
        super

        remove_chars "\n", text
      end
    end
  end
end
