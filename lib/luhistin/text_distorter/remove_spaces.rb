module Luhistin
  module TextDistorter
    class RemoveSpaces < CurveDistorter
      include CharacterRemover
      
      def distort(text, curve)
        super

        remove_chars " ", text
      end
    end
  end
end
