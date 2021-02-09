module Luhistin
  module TextDistorter
    class ShakeWords < Skeleton

      def distort(text, curve)
        @curve = curve

        modify_some_words(text) do |word|
          mangle(word, 8) 
        end
      end

      private

      def mangle(word, hardness=1)
        if (only_letters(word).length < 4)
          return word
        end

        first_letter = word[0]
        last_letter = word[-1]
        middle_part = Luhistin::ShufflableString.new( word[1..-2] )

        hardness.times do
          middle_part.switch_adjacent_random_letters!
        end

        first_letter + middle_part + last_letter
      end

      def only_letters(word)
        word.gsub(/[^0-9a-zA-ZåäöÅÄÖ ]/i, '')
      end

    end
  end
end