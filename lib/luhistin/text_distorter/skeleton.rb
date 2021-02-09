module Luhistin
  module TextDistorter
    class Skeleton

      def initialize
      	@curve = nil
      end

      # Use this to remove certain characters from text
	  def remove_chars(chr, text)
			locations = text.indexes_of(chr)

			locations.reverse.each do |space|
			  rel_position = (space.to_f) / (text.length)

			  if randomly_selected?(rel_position)
			  	text.slice! space
			  end
			end

		text
	  end

      # This is a convenience function to use, if you
      # want to modify text word-by-word basis

	  def modify_some_words(text)
	  	traverse_each_word(text) do |word, rel_position|
	  	  if randomly_selected? (rel_position)
	  	  	yield(word)
	  	  else
	  	  	word
	  	  end
	  	end
	  end

	  def traverse_each_word(text)
		lines = text.wordlines
		res = lines.map.with_index do |line, li|
		    line.map.with_index do |word, wi|
      		  rel_position = lines.relative_position_of_word(li, wi)

		      yield(word, rel_position)

		    end
		  end
		res.revert_wordlines
	  end

      # Find the "bias" (todo: think better names)
      # for randomly determining if the distortion should happen

      def randomly_selected? (relative_position)
      	Random.rand < propability_from_curve( relative_position )
      end

	  def propability_from_curve(x_point)
	    @curve[(@curve.length-1)*x_point]
      end

    end
  end
end

