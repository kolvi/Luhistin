module Luhistin
  module TextDistorter
  	module CharacterSprinkler

      # This can be used to "sprinkle" characters here and there
      # to create snazzy-looking text art
      def sprinke_chars(text, char_list)
        chunk_length = text.length / @curve.curve_y_values.length
        chunks = text.chars.each_slice(chunk_length).map(&:join)

        chunks.map.with_index do |chunk, ind|
          # There is most likely one chunk more than there are
          # indexes at "curves", since split is not even

          rel_position = ind.to_f / chunks.length

          (0..chunk.length - 1).to_a.reverse.each do |c_ind|
            if randomly_selected? (rel_position)
              chunk.insert(c_ind, "#{char_list.sample}")
            end
          end
          chunk
        end.join
      end
      
  	end
  end
end
