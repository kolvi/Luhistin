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

        middle_part = word[1..-2]
        hardness.times do
          switch_adjacent_random_letters(middle_part)
        end

        word[0] + middle_part + word[-1]
      end

      def only_letters(word)
        word.gsub(/[^0-9a-zA-ZåäöÅÄÖ ]/i, '')
      end

      def switch_adjacent_random_letters(word)
        leftmost_letter_index = rand(0..(word.length-2))
        a = leftmost_letter_index   # just to make the next command shorter

        # Switch two letters in place
        word[a], word[a+1] = word[a+1], word[a]
      end

    end
  end
end