module Luhistin
  module TextDistorter
    class ShuffleWords < Skeleton

      def distort(text, curve)
		  word_objects = text.wordlines.indexify
		  linear_shuffle(word_objects, curve)

		  word_objects.deindexify.revert_wordlines
      end

      private

      def linear_shuffle(word_objects, curve)

		(0..word_objects.length).each do |ind|

		    thresh = (ind.to_f)/(word_objects.length)
		    real_offset = adjusted_offset(thresh, curve)

		    if randomly_selected?(real_offset)
		      word_objects.shuffle_further(ind)
		    end
		end

  	  end

    end
  end
end
