module Luhistin
  module TextDistorter
  	module WordTraverser

      # This is a convenience function to use, if you
      # want to modify text word-by-word basis

      def modify_some_words(text)
        lines = Luhistin::LineWordList.new(text)

        lines.traverse do |word, rel_position|
          if randomly_selected? (rel_position)
            yield(word)
          else
            word
          end
        end
      end
      
  	end
  end
end
