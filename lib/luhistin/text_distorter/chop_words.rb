module Luhistin
  module TextDistorter
    class ChopWords < Skeleton

      def distort(text, curve)
      	@curve = curve

      	modify_some_words(text) do |word|
      	  word.insert_random_space
      	end
      end

    end
  end
end
