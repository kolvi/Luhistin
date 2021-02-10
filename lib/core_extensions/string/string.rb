class String
  def random_cut_point
    rand(1..(length-1))
  end

  def insert_random_space
    insert random_cut_point, " "
  end

  def indexes_of(chr)
    index_list = [[]]
    (index_list + split(Regexp.new(chr))[0..-2]).inject do |indexes, str|
      indexes.empty? ? [str.length] : (indexes + [indexes.last+str.length+1])
    end
  end
end
