module Luhistin
  class LineWordList

    def initialize(str)
      @word_grid = Luhistin::TextTool::WordGridCreator.new.create_word_grid(str)
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

    # Note: This could have some use a public function, but
    # currently no other class needs it

    def relative_position_of_word(line_ind, word_ind)
      return 0 if @word_grid.flatten.length == 0 # border case: empty array

      flattened_index = if (line_ind == 0)
                          word_ind
                        else
                          no_of_nested_items(line_ind - 1) + word_ind
                        end

      # Return "relative position" of word = float between 0 and 1)
      flattened_index.to_f / @word_grid.flatten.length
    end

    def revert_to_string(wordlines)
      wordlines.map { |words_in_line| words_in_line.join(" ") }.join("\n")
    end

    def no_of_nested_items(last_index_counted)
      @word_grid[0..last_index_counted].flatten.length
    end
  end
end
