module Luhistin
  module TextTool
    class WordGridCreator
      def create(str)
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

      def revert_to_string(word_grid)
        word_grid.map { |line| line.join(" ") }.join("\n")
      end

      private

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

        # NOTE: Almost all non-letter characters, such as commas,
        # explanation marks and others are entirely cut away from words
        # and not returned! "_", "#", ":" and "@" and exceptions,
        # so the program can handle copy-pasted tweets a bit better.
        #
        # This is okay, because the purpose of Luhistin is to create
        # messy word art and the result should act as an inspiration for
        # the writer / artist. She/he/they can add those characters
        # back later on.
        #

        cut_expression = /[^a-zA-ZåäöÅÄÖ#_\@:]{1,5}/
        line.split(cut_expression)
      end
    end
  end
end
