module Luhistin
  module TextDistorter
    class RemoveSpaces

      def distort(text)
      	remove_chars " ", txt, curve
      end

      private

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

    end
  end
end

