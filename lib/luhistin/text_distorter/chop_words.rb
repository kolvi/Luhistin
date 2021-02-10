module Luhistin
  module TextDistorter
    class ChopWords < Skeleton

      def distort(text, curve)
      	@curve = curve

      	modify_some_words(text) do |word|
      	  insert_random_space(word)
          #word.insert_random_space
      	end
      end

      private

      def insert_random_space(str)
        str.insert(str.random_cut_point, " ")
      end

    end
  end
end
