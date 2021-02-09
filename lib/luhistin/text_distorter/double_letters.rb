module Luhistin
  module TextDistorter
    class DoubleLetters < Skeleton

      def distort(text, curve)
        modify_some_words(text, curve) do |word|
          if (word.length > 3)
            dup_point = word.random_cut_point
            word.insert(dup_point, word[dup_point])
          else
            word
          end
        end
      end

    end
  end
end