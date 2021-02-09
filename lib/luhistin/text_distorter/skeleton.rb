module Luhistin
  module TextDistorter
    class Skeleton

      # Use this to remove certain characters from text

	  def remove_chars(chr, txt, curve)
			locations = txt.indexes_of(chr)

			locations.reverse.each do |space|
			  threshold = (space.to_f) / (txt.length)
			  propability = adjusted_offset(threshold, curve)

			  if randomly_selected?(propability)
			  	txt.slice! space
			  end
			end

		txt
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
      		  final_bias = adjusted_offset( lines.deep_position_bias(li, wi), curve )

		      yield(word, final_bias)

		    end
		  end
		res.revert_wordlines
	  end

      # Find the "bias" (todo: think better names)
      # for randomly determining if the distortion should happen

	  def adjusted_offset(offs, curve)
	    curve[(curve.length-1)*offs]
      end

      def randomly_selected? (propability)
      	Random.rand < propability
      end

    end
  end
end

