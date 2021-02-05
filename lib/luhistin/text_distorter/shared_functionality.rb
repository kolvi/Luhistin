

# private functions

def only_letters(word)
	word.gsub(/[^0-9a-zA-ZåäöÅÄÖ ]/i, '')
end

# TEST ALL!!!!

def switch_adjacent_letters(text)
  first_index = random_int_between(0, text.length-2)

  switch_letters_in_places(text, first_index, first_index+1)
end

# NOTE: Is this used at all in code?
def switch_any_two_letters(text)

  # Generate two random indexes
  last_index = text.length-1
  indexes = unique_random_ints_between(0, last_index, 2).sort

  switch_letters_in_places(text, indexes[0], indexes[1])
end

def switch_letters_in_places(text, a, b)
  #NOTE: Function was longer
  text[a], text[b] = text[b], text[a]
end

def unique_random_ints_between(min, max, amount)
  # TEST !!!!
  # https://stackoverflow.com/questions/119107/how-do-i-generate-a-list-of-n-unique-random-numbers-in-ruby
  (min..max).to_a.shuffle.take(amount)  
end

def random_int_between(min, max)
  # TEST !!!!
  (min..max).to_a.sample
  # was:
  # (Random.rand*((max-min)+1)).floor + min
end
