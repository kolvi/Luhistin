require 'luhistin'

describe Luhistin::TextTool::WordChainCreator do

  it "correctly creates a word chain" do
    grid = [
      ["A", "word"],
      ["for","you,","sir",],
      ["please!"],
      ["Simple", "word."]
    ]
    allow_any_instance_of(Luhistin::TextTool::WordGridCreator).to receive(:create).with(:the_string).and_return(grid)
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

    expect(subject.create(:the_string)).to eq(expected_result)
  end


end
