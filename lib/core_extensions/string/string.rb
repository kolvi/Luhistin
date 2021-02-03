class String

  # For multi-line string, return an array of lines
  def lines
    split("\n")
  end

  # Same as above, except lines are also separated to words (two-dimensional array) 
  def wordlines
    lines.map(&:separate_words)
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


  def random_cut_point
    random_integer_between 1, (length-1)
  end

  def insert_random_space
    insert random_cut_point, " "
  end

  def indexes_of(chr)
    index_list = [[]]
    (index_list + split(Regexp.new(chr))[0..-2]).inject do |indexes, str|
      indexes.empty? ? [str.length] : (indexes + [indexes.last+str.length+1])
    end
  end
end
