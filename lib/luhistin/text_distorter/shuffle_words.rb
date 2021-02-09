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
		      #word_objects.shuffle_further(ind)
		      shuffle_further(word_objects, ind)
		    end
		end
  	  end

	  def shuffle_further(arry, ind)
	    last_ind = arry.length-1
	    if (ind < last_ind) # Don't try to shuffle last one
	      new_ind = rand((ind+1)..last_ind)

	      #https://coderwall.com/p/be_1va/swap-two-elements-of-an-array-in-ruby
	      arry[ind], arry[new_ind] = arry[new_ind], arry[ind]
	    end
	  end  	  

    end
  end
end
