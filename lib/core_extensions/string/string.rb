class String

  # Gives a random point in the middle of a word.
  # TODO: Does it actually do that? Debug
  #
  # We carefully choose to monkey-patch String class
  # with this function, since it leads to quite elegant code.
  #
  def random_cut_point
    rand(1..(length-1))
  end
end
