module Luhistin
  module TextDistorter
  	module CharacterSprinkler

      # This can be used to "sprinkle" characters here and there
      # to create snazzy-looking text art
      def sprinke_chars(text, char_list)

      	new_text = text.dup
      	last_character = new_text.length-1

      	last_character.downto(0).each do |ind|
      		rel_position = ind.to_f / last_character
            if randomly_selected? (rel_position)
              new_text.insert(ind, char_list.sample)
            end
      	end
      	new_text

      end
      
  	end
  end
end
