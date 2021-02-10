module Luhistin
  module TextTool
    class CharacterIndexFinder
      def indexes_of(text, chr)
        check_arguments_for_errors(text, chr)

        indexes = []
        buffer = text.dup

        # Note: This is a pretty "old-school" method of traversing
        # through string, but imho MUCH cleaner than some
        # inject magic with regexes

        while true do
          if (next_occasion = buffer.index(chr))
            buffer.slice!(0, next_occasion + 1)

            next_occasion += (indexes.last + 1) unless indexes.empty?
            indexes.push(next_occasion)
          else
            break  # No more matches found, next_occasion == nil
          end
        end
        indexes
      end

      private

      def check_arguments_for_errors(text, chr)
        if (chr.class != String)
          raise ArgumentError, "Character is not string"
        else
          raise ArgumentError, "More than one character supplied" if (chr.length > 1)
          raise ArgumentError, "No character supplied" if (chr.length == 0)
        end

        if (text.class != String)
          raise ArgumentError, "Text is not string"
        end
      end
    end
  end
end
