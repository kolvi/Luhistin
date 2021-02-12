require 'luhistin'
require 'pry'

describe Luhistin::TextTool::WordGridCreator do

  it "correctly creates a word grid" do
    the_string = "A word\nfor you, sir\nplease!\nSimple word."

    # NOTE: Non-letter characters "!", "." and "." are cut
    # from results. That's intended behaviour.
    # (see comments in the code defining WordGridCreator)

    expected_result = [
      ["A", "word"],
      ["for","you","sir",],
      ["please"],
      ["Simple", "word"]
    ]

    expect(subject.create(the_string)).to eq(expected_result)

  end

  it "handles an empty string graciously" do
    expect(subject.create("")).to eq([])
  end

  it "handles empty rows in the string" do
    the_string = "A word\n\nfor you, sir"
    expected_result = [["A", "word"], [], ["for", "you", "sir"]]
    expect(subject.create(the_string)).to eq(expected_result)
  end

  it "treats consequtive spaces as a single boundary, up to five spaces" do
    the_string = "A word\nfor  you,    sir"
    expected_result = [["A", "word"], ["for", "you", "sir"]]
    expect(subject.create(the_string)).to eq(expected_result)
  end

  it 'reads selected few special characters (_@#:) as parts of word' do
    the_string = "A _word_\nfor: you, @sir #letstalk"
    expected_result = [["A", "_word_"], ["for:", "you", "@sir", "#letstalk"]]
    expect(subject.create(the_string)).to eq(expected_result)
  end

  it 'converts a grid back to string' do
    grid = [["a", "b:", "c"],[],["d", "e"]]
    expected_result = "a b: c\n\nd e"
    expect(subject.revert_to_string(grid)).to eq(expected_result)
  end

  it 'converts an empty grid back to string' do
    grid = []
    expect(subject.revert_to_string(grid)).to eq("")
  end

end
