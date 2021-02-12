module Luhistin
  module TextDistorter
  	module WordTraverser

      # This is a convenience function to use, if you
      # want to modify text word-by-word basis

      def modify_some_words(text)
        grid = Luhistin::TextTool::WordGridCreator.new.create(text)
        traverser = Luhistin::TextTool::WordGridTraverser.new

        traverser.traverse(grid) do |word, rel_position|
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
