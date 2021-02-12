module Luhistin
  module TextDistorter
  	module CharacterRemover

      # Use this to remove certain characters from text
      def remove_chars(text, chr)
        new_text = text.dup
        index_finder = Luhistin::TextTool::CharacterIndexFinder.new
        locations = index_finder.indexes_of(new_text, chr)

        locations.reverse.each do |space|
          rel_position = (space.to_f) / (new_text.length)

          if randomly_selected?(rel_position)
            new_text.slice! space
          end
        end

        new_text
      end

  	end
  end
end
