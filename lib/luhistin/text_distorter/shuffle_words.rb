module Luhistin
  module TextDistorter
    class ShuffleWords < CurveDistorter
      def distort(text, curve)
        super
        chain = to_word_chain(text)
        linear_shuffle(chain)
        revert_word_chain(chain)
      end

      private

      def to_word_chain(text)
        Luhistin::TextTool::WordChainCreator.new.create_word_chain(text)
      end

      def revert_word_chain(chain)
        Luhistin::TextTool::WordChainCreator.new.revert_word_chain_to_string(chain)
      end

      def linear_shuffle(word_chain)
        (0..word_chain.length).each do |ind|
          relative_position = (ind.to_f) / (word_chain.length)

          if randomly_selected?(relative_position)
            shuffle_further(word_chain, ind)
          end
        end
      end

      def shuffle_further(arry, ind)
        last_ind = arry.length - 1
        if (ind < last_ind) # Don't try to shuffle last one
          new_ind = rand((ind + 1)..last_ind)

          # https://coderwall.com/p/be_1va/swap-two-elements-of-an-array-in-ruby
          arry[ind], arry[new_ind] = arry[new_ind], arry[ind]
        end
      end
    end
  end
end
