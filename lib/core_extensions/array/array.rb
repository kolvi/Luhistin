class Array
  def no_of_nested_items(until_ind)
    self[0..until_ind].map(&:length).sum
  end

  def relative_position_of_word(ind_a, ind_b)
    return 0 if self.flatten.length == 0 # border case: empty array

    if (ind_a > 0)
      prevs = no_of_nested_items(ind_a-1)
    else
      prevs = 0
    end
    (prevs+ind_b).to_f / self.flatten.length

  end

  def revert_wordlines
    map { |wordlist| wordlist.join(" ") }.join("\n")
  end

  def indexify
    map.with_index do |line, l_index|
      if (l_index == 0)
        words_so_far = 0
      else
        words_so_far = no_of_nested_items(l_index-1)
      end

      line.map.with_index do |word, w_index|
        {
          word: word,
          index: w_index+words_so_far,
          endline_after: w_index == (line.length-1)
        }
      end
    end.flatten
  end

  def deindexify
    map do |obj|
      word = obj[:word]
      obj[:endline_after] ? "#{word}\n" : word
    end.join(" ").split("\n").map(&:strip).map(&:split)
  end

end