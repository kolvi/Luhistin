require 'luhistin'

describe Luhistin::TextTool::WordChainCreator do

  it "correctly creates a word chain" do
    grid = [
      ["A", "word"],
      ["for","you,","sir",],
      ["please!"],
      ["Simple", "word."]
    ]
    expected_result = [
      {:word=>"A", :endline_after=>false},
      {:word=>"word", :endline_after=>true},
      {:word=>"for", :endline_after=>false},
      {:word=>"you,", :endline_after=>false},
      {:word=>"sir", :endline_after=>true},
      {:word=>"please!", :endline_after=>true},
      {:word=>"Simple", :endline_after=>false},
      {:word=>"word.", :endline_after=>true}
    ]

    allow_any_instance_of(Luhistin::TextTool::WordGridCreator).to receive(:create).with(:the_string).and_return(grid)
    expect(subject.create(:the_string)).to eq(expected_result)
  end

  it "handles empty lines within a word grid" do
    grid = [
      ["A", "word"],
      [],
      ["for","you,","sir",],
    ]
    expected_result = [
      {:word=>"A", :endline_after=>false},
      {:word=>"word", :endline_after=>true},
      {:word=>"", :endline_after=>true},
      {:word=>"for", :endline_after=>false},
      {:word=>"you,", :endline_after=>false},
      {:word=>"sir", :endline_after=>true}
    ]
    allow_any_instance_of(Luhistin::TextTool::WordGridCreator).to receive(:create).with(:the_string).and_return(grid)
    expect(subject.create(:the_string)).to eq(expected_result)
  end

  it "handles an empty word grid graciously" do
    grid = []
    allow_any_instance_of(Luhistin::TextTool::WordGridCreator).to receive(:create).with(:the_string).and_return(grid)
    expect(subject.create(:the_string)).to eq([])
  end

  it 'converts a chain back to string' do
    chain = [
      {:word=>"A", :endline_after=>false},
      {:word=>"word", :endline_after=>true},
      {:word=>"", :endline_after=>true},
      {:word=>"for", :endline_after=>false},
      {:word=>"you,", :endline_after=>false},
      {:word=>"sir", :endline_after=>true}
    ]

    # Note: Last newline or space character is removed,
    # even though "sir" ends with newline in chain
    expected_result = "A word\n\nfor you, sir"
    expect(subject.revert_to_string(chain)).to eq(expected_result)
  end

end
