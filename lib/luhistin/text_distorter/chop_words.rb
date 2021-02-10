module Luhistin
  module TextDistorter
    class ChopWords < CurveDistorter
      include WordTraverser
      
      def distort(text, curve)
        super

        modify_some_words(text) do |word|
          insert_random_space(word)
        end
      end

      private

      def insert_random_space(str)
        str.insert(str.random_cut_point, " ")
      end
    end
  end
end
