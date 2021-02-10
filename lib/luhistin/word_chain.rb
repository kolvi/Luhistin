module Luhistin
  class WordChain
    include WordGrid

  	def initialize(str)
  		create_word_grid(str).map do |line|
			wordlist_to_word_hashes(line)
		end.flatten
  	end

  	private

  	def wordlist_to_word_hashes(line)
  		return [ last_node("") ] if line.empty?

		line[0..-2].map do |word|
		  not_last_node(word)
		end.append( last_node(line.last) )
  	end

  	def not_last_node(word)
  		{ word: word, endline_after: false }
  	end

  	def last_node(word)
  		{ word: word, endline_after: true }
  	end

  	# TODO: Create "Include" file for line_word_list.rb and word_chain.rb to share

  end
end