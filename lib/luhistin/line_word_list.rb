module Luhistin
  class LineWordList < Array

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
  		str.split("\n").map(&:separate_words)
  	end

	def relative_position_of_word(line_ind, word_ind)
	    #return 0 if self.flatten.length == 0 # border case: there are no words

	    if (line_ind > 0)
	    	previous_lines = self[0..line_ind-1]
	    	previous_lines.flatten.length + word_ind
	    else
	    	word_ind
	    end
	end

	# Convert LineWordList back to multi-line string
  	# was: revert_wordlines
	def to_s
	  map { |words_in_line| words_in_line.join(" ") }.join("\n")
	end

  	private

	def no_of_nested_items(last_index_counted)
	   self[0..last_index_counted].flatten.length
	end

    def separate_words
	  	# The following expression finds parts of a text which can be
	  	# considered "word boundaries". Most often they are spaces,
	  	# but the expression handles a bit dirtier input data, looking for
	  	# "1-5 long sequence of chars that are not letters, underscores
	  	# nor '@' or ':' signs".

	    cut_expression = /[^a-zA-ZåäöÅÄÖ#_\@:]{1,5}/
	    split(cut_expression)
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