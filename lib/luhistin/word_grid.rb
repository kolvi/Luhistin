module Luhistin
  module WordGrid
    def create_word_grid(str)
      # Converts multi-line string to array of lines, which consists
      # array of words (in other words, two-dimensional array of words).
      # This structure allows things like switching places of words, giving
      # paragraphs of texts a "shuffled" feel.
      #
      # example_text = "Hello world\nHow are you"
      # example_text.wordlines == [["Hello, "world"], ["How", "are", "you"]]
      #
      # Technically, it's not precisely a "grid", but this word
      # is snappier than "array of lines and words".
      #
      str.split("\n").map do |line|
        separate_words(line)
      end
    end

    def separate_words(line)
      # The following expression finds parts of a text which can be
      # considered "word boundaries". Most often they are spaces,
      # but the expression handles a bit dirtier input data, looking for
      # "1-5 long sequence of chars that are not letters, underscores
      # nor '@' or ':' signs".
      #
      # The purpose of this program is to handle all kinds of
      # crappy input data, such as tweets, so we need this kind of
      # tolerable expression to separate words.

      cut_expression = /[^a-zA-ZåäöÅÄÖ#_\@:]{1,5}/
      line.split(cut_expression)
    end
  end
end
