module Luhistin
  module WordGrid
  	def create_word_grid(str)
  		# Technically, it's not precisely a "grid", but this word
  		# is snappier than "array of lines and words". So let's tolerate it.
  		#
        str.split("\n").map(&:separate_words)
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