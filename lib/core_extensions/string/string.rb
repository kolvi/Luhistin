class String

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
  def wordlines
    split("\n").map(&:separate_words)
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
    rand(1..(length-1))
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
