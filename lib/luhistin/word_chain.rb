module Luhistin
  class WordChain
    include WordGrid

    attr_reader :word_hash_list

  	def initialize(str)
  		@word_hash_list = create_word_grid(str).map do |line|
			wordlist_to_word_hashes(line)
		end.flatten
  	end

  	def revert_to_string
  		@word_hash_list.inject("") do |result, word_hash|
	      word = word_hash[:word]
	      separator = word_hash[:endline_after] ? "\n" : " "
  		  result + word + separator
  		end
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

  end
end