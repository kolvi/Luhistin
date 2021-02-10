module Luhistin
  module TextDistorter
    class Skeleton

      def initialize
      	@curve = nil
      end

      # Use this to remove certain characters from text
	  def remove_chars(chr, text)
			#locations = text.indexes_of(chr)
			locations = indexes_of(chr, text)

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
	  	lines = Luhistin::LineWordList.new(text)

	  	lines.traverse do |word, rel_position|
	  	  if randomly_selected? (rel_position)
	  	  	yield(word)
	  	  else
	  	  	word
	  	  end
	  	end
	  end

	  # This can be used to "sprinkle" characters here and there
	  # to create snazzy-looking text art
	  def sprinke_chars(text, char_list)
		  chunk_length = text.length / @curve.length
		  chunks = text.chars.each_slice(chunk_length).map(&:join)

		  chunks.map.with_index do |chunk, ind|
		    # There is most likely one chunk more than there are
		    # indexes at "curves", since split is not even 

		    rel_position = ind / chunks.length

		    (0..chunk.length-1).to_a.reverse.each do |c_ind|
		      if randomly_selected? (rel_position)
		        chunk.insert(c_ind, "#{char_list.sample}")
		      end
		    end
		    chunk
		  end.join
	  end


      def randomly_selected? (relative_position)
      	Random.rand < propability_from_curve( relative_position )
      end

	  def propability_from_curve(x_point)
	    @curve[(@curve.length-1)*x_point]
      end

	  def indexes_of(chr, text)
	    index_list = [[]]
	    character_finder = Regexp.new(chr)
	    (index_list + text.split(character_finder)[0..-2]).inject do |indexes, str|
	      indexes.empty? ? [str.length] : (indexes + [indexes.last+str.length+1])
	    end
	  end

    end
  end
end

