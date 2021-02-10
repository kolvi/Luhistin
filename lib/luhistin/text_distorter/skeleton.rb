module Luhistin
  module TextDistorter
    class Skeleton
      attr_accessor :curve

      def initialize
        @curve = nil
      end

      # Use this to remove certain characters from text
      def remove_chars(chr, text)
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

      # This can be used to "sprinkle" characters here and there
      # to create snazzy-looking text art
      def sprinke_chars(text, char_list)
        chunk_length = text.length / @curve.length
        chunks = text.chars.each_slice(chunk_length).map(&:join)

        chunks.map.with_index do |chunk, ind|
          # There is most likely one chunk more than there are
          # indexes at "curves", since split is not even

          rel_position = ind / chunks.length

          (0..chunk.length - 1).to_a.reverse.each do |c_ind|
            if randomly_selected? (rel_position)
              chunk.insert(c_ind, "#{char_list.sample}")
            end
          end
          chunk
        end.join
      end

      def randomly_selected?(relative_position)
        Random.rand < propability_from_curve(relative_position)
      end

      def propability_from_curve(x_point)
        if (x_point == 1)
          # Border case: for number one, return last index
          # since using formula would return too large a value
          the_index = @curve.length - 1
        else
          the_index = @curve.length * x_point
        end
        @curve[the_index]
      end
    end
  end
end
