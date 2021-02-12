module Luhistin
  module TextTool
    class WordChainCreator

      def create(str)
        grid = Luhistin::TextTool::WordGridCreator.new.create(str)
        grid.map do |line|
          line_to_word_hashes(line)
        end.flatten
      end

      def revert_to_string(word_chain)
        word_chain.inject("") do |result, word_hash|
          word = word_hash[:word]
          separator = word_hash[:endline_after] ? "\n" : " "
          result + word + separator
        end
      end

      private

      def line_to_word_hashes(line)
        return [last_node("")] if line.empty?

        line[0..-2].map do |word|
          not_last_node(word)
        end.append(last_node(line.last))
      end

      def not_last_node(word)
        { word: word, endline_after: false }
      end

      def last_node(word)
        { word: word, endline_after: true }
      end

    end
  end
end
