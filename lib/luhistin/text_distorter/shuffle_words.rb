module Luhistin
  module TextDistorter
    class ShuffleWords < Skeleton

      def distort(text, curve)
	      @curve = curve

		  #word_chain = text.wordlines.indexify
		  word_chain = Luhistin::WordChain.new(text)
		  linear_shuffle(word_chain.word_hash_list)

		  #word_chain.deindexify.revert_wordlines
		  word_chain.revert_to_string
      end

      private

      def linear_shuffle(word_chain)
		(0..word_chain.length).each do |ind|

		    relative_position = (ind.to_f)/(word_chain.length)

		    if randomly_selected?( relative_position )
		      shuffle_further(word_chain, ind)
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
