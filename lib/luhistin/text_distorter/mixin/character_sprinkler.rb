module Luhistin
  module TextDistorter
  	module CharacterSprinkler

      # This can be used to "sprinkle" characters here and there
      # to create snazzy-looking text art
      def sprinkle_chars(text, char_list)
      	return "" if text == ""

      	new_text = text.dup
      	last_character = new_text.length-1

      	last_character.downto(0).each do |ind|
      		if (text.length == 1)
      			rel_position = 0
      		else
      			# This would be division by zero, if text.length == 1
      			rel_position = ind.to_f / last_character
      		end

            if randomly_selected? (rel_position)
              new_text.insert(ind, char_list.sample)
            end
      	end
      	new_text

      end
      
  	end
  end
end
