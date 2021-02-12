require 'luhistin'

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


end
