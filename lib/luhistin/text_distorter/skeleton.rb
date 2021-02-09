module Luhistin
  module TextDistorter
    class Skeleton

      # Use this to remove certain characters from text

	  def remove_chars(chr, text, curve)
			locations = text.indexes_of(chr)

			locations.reverse.each do |space|
			  relative_position = (space.to_f) / (text.length)
			  propability = propability_from_curve(relative_position, curve)

			  if randomly_selected?(propability)
			  	text.slice! space
			  end
			end

		text
	  end

      # This is a convenience function to use, if you
      # want to modify text word-by-word basis

	  def modify_some_words(text, curve)
	  	traverse_each_word(text, curve) do |word, propability|
	  	  if randomly_selected? (propability)
	  	  	yield(word)
	  	  else
	  	  	word
	  	  end
	  	end
	  end

	  def traverse_each_word(text, curve)
		lines = text.wordlines
		res = lines.map.with_index do |line, li|
		    line.map.with_index do |word, wi|
      		  propability = propability_from_curve( lines.relative_position_of_word(li, wi), curve )

		      yield(word, propability)

		    end
		  end
		res.revert_wordlines
	  end

      # Find the "bias" (todo: think better names)
      # for randomly determining if the distortion should happen

	  def propability_from_curve(x_point, curve)
	    curve[(curve.length-1)*x_point]
      end

      def randomly_selected? (propability)
      	Random.rand < propability
      end

    end
  end
end

