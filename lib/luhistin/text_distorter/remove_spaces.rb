module Luhistin
  module TextDistorter
    class RemoveSpaces < Skeleton
      include CharacterRemover
      
      def distort(text, curve)
        super

        remove_chars " ", text
      end
    end
  end
end
