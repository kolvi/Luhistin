module Luhistin
  module TextDistorter
    class DoubleLetters < Skeleton

      def distort(text, curve)
      	traverse_each_word(text) do |word, relative_pos|
		      offset = adjusted_offset(relative_pos, curve)

	        if (word.length > 3 && Random.rand < offset)
	          dup_point = word.random_cut_point
	          word.insert(dup_point, word[dup_point])
	        else
	          word
	        end

      	end
      end

    end
  end
end