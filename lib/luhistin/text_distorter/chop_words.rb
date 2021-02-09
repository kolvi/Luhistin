module Luhistin
  module TextDistorter
    class ChopWords < Skeleton

      def distort(text, curve)
      	traverse_each_word(text) do |word, relative_pos|
		   offset = adjusted_offset(relative_pos, curve)

 	       (Random.rand < offset) ? word.insert_random_space : word
      	end
      end

    end
  end
end
