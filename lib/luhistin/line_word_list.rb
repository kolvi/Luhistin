module Luhistin
  class LineWordList
      include WordGrid

  	  # The constructor:
  	  #
	  # Converts multi-line string to array of lines, which consists
	  # array of words (in other words, two-dimensional array of words).
	  # This structure allows things like switching places of words, giving
	  # paragraphs of texts a "shuffled" feel.
	  #
	  # example_text = "Hello world\nHow are you"
	  # example_text.wordlines == [["Hello, "world"], ["How", "are", "you"]]
	  #
	  # Array-class has method "revert_wordlines" whichs reverts this functionality,
	  # returning the original string.
	  #
	  # ( any_text == any_text.wordlines.revert_wordlines )
	  #

  	def initialize(str)
  		@word_grid = create_word_grid(str)
  	end

	def relative_position_of_word(line_ind, word_ind)
	    return 0 if @word_grid.flatten.length == 0 # border case: empty array
	    flattened_index = if (line_ind == 0)
	    	word_ind
	    else
	    	no_of_nested_items(line_ind-1) + word_ind
	    end

	    # Return "relative position" of word = float between 0 and 1)
	    flattened_index.to_f / @word_grid.flatten.length
	end

	#
	# Service function for browsing list word by word, modifying
	# the words as necessary and getting result (the entire
	# string) back as a string.
	#

	def traverse
		result = @word_grid.map.with_index do |line, li|
			line.map.with_index do |word, wi|
      			rel_position = relative_position_of_word(li, wi)
				yield(word, rel_position)
			end
		end

		# Convert result straight away to string 
		revert_to_string(result)
	end

  	private

  	def revert_to_string(wordlines)
  		wordlines.map { |words_in_line| words_in_line.join(" ") }.join("\n")
  	end

	def no_of_nested_items(last_index_counted)
	   @word_grid[0..last_index_counted].flatten.length
	end

  end
end

=begin
	
class Array

  def revert_wordlines
    map { |wordlist| wordlist.join(" ") }.join("\n")
  end

  def indexify
    map.with_index do |line, l_index|
      if (l_index == 0)
        words_so_far = 0
      else
        words_so_far = no_of_nested_items(l_index-1)
      end

      line.map.with_index do |word, w_index|
        {
          word: word,
          index: w_index+words_so_far,
          endline_after: w_index == (line.length-1)
        }
      end
    end.flatten
  end

  def deindexify
    map do |obj|
      word = obj[:word]
      obj[:endline_after] ? "#{word}\n" : word
    end.join(" ").split("\n").map(&:strip).map(&:split)
  end


end	
=end