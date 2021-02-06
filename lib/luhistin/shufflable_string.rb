module Luhistin
  class ShufflableString < String

    def only_letters
      self.gsub(/[^0-9a-zA-ZåäöÅÄÖ ]/i, '')
    end

    def switch_adjacent_random_letters!(text)
      first_index = random_int_between(0, text.length-2)

      switch_letters!(text, first_index, first_index+1)
    end

    # NOTE: Is this used at all in code?
    def switch_random_letters!

      # Generate two random indexes
      last_index = self.length-1
      indexes = unique_random_ints_between(0, last_index, 2).sort

      switch_letters!(text, indexes[0], indexes[1])
    end

    def switch_letters!(a, b)
      # TOTHINK: Should this immute the string or be pure function?
      #
      self[a], self[b] = self[b], self[a]
      self
    end

    private

    def unique_random_ints_between(min, max, amount)
      # TODO: Throw error if min > max 
      #
      # TODO: Throw error if (max-min+1) < amount – attempt to roll
      # more numbers than there are
      #
      # https://stackoverflow.com/questions/119107/how-do-i-generate-a-list-of-n-unique-random-numbers-in-ruby
      (min..max).to_a.shuffle.take(amount)  
    end

    def random_int_between(min, max)
      # TODO: Throw exception if min > max
      (min..max).to_a.sample
    end

  end
end