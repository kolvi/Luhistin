module Luhistin
  module TextDistorter
  	module CharacterRemover

      # Use this to remove certain characters from text
      def remove_chars(text, chr)
        index_finder = Luhistin::TextTool::CharacterIndexFinder.new
        locations = index_finder.indexes_of(text, chr)

        locations.reverse.each do |space|
          rel_position = (space.to_f) / (text.length)

          if randomly_selected?(rel_position)
            text.slice! space
          end
        end

        text
      end

  	end
  end
end
