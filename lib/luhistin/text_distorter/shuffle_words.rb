module Luhistin
  module TextDistorter
    class ShuffleWords < Skeleton

      def distort(text, curve)
	      @curve = curve

		  word_objects = text.wordlines.indexify
		  linear_shuffle(word_objects)

		  word_objects.deindexify.revert_wordlines
      end

      private

      def linear_shuffle(word_objects)

		(0..word_objects.length).each do |ind|

		    relative_position = (ind.to_f)/(word_objects.length)

		    if randomly_selected?( relative_position )
		      word_objects.shuffle_further(ind)
		    end
		end

  	  end

    end
  end
end
