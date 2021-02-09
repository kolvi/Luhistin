module Luhistin
  module TextDistorter
    class ChopWords < Skeleton

      def distort(text, curve)
      	modify_some_words(text, curve) do |word|
      	  word.insert_random_space
      	end
      end

    end
  end
end
