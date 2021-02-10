module Luhistin
  module TextDistorter
    class DoubleLetters < Skeleton
      def distort(text, curve)
        super

        modify_some_words(text) do |word|
          if (word.length > 3)
            duplicate_some_letter(word)
          else
            word
          end
        end
      end

      private

      def duplicate_some_letter(word)
        selected_letter_indx = word.random_cut_point
        word.insert(selected_letter_indx, word[selected_letter_indx])
      end
    end
  end
end
