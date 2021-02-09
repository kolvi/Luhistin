module Luhistin
  module TextDistorter
    class Skeleton

	  def remove_chars(chr, txt, curve)
			locations = txt.indexes_of(chr)

			locations.reverse.each do |space|
			  threshold = (space.to_f) / (txt.length)
			  bias = adjusted_offset(threshold, curve)

			  if (Random.rand < bias)
			  	txt.slice! space
			  end
			end

		txt
	  end

	  def modify_some_words(text, curve)
	  	traverse_each_word(text, curve) do |word, final_bias|
	  	  if (Random.rand < final_bias)
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

	  def adjusted_offset(offs, curve)
	    curve[(curve.length-1)*offs]
      end

    end
  end
end

