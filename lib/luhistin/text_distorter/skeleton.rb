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

	  def traverse_each_word(text)
		lines = text.wordlines
		res = lines.map.with_index do |line, li|
		    line.map.with_index do |word, wi|
		      the_bias = lines.deep_position_bias(li, wi)

		      yield(word, the_bias)

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

