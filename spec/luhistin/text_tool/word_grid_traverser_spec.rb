require 'luhistin'

describe Luhistin::TextTool::WordGridTraverser do

  it "traverses a simple word grid, activating block correctly" do
    grid = [
      ["A", "word"],
      ["for","you,","sir",],
      ["please!"],
      ["Simple", "word."]
    ]
    expected_result = [
      [["A", 0.0], ["word", 0.125]],
      [["for", 0.25], ["you,", 0.375], ["sir", 0.5]],
      [["please!", 0.625]],
      [["Simple", 0.75], ["word.", 0.875]],
    ]

    result = subject.traverse(grid) do |word, rel_position|
      [word, rel_position]
    end

    expect(result).to eq(expected_result)
  end

  it "handles an empty list graciously" do
    expect(subject.traverse([])).to eq([])
  end

  it "handles empty rows graciously" do
    grid = [
      ["A", "word"],
      [],
      ["for","you,","sir"],
    ]
    expected_result = [
      [["A", 0.0], ["word", 0.2]],
      [],
      [["for", 0.4], ["you,", 0.6], ["sir", 0.8]]
    ]

    result = subject.traverse(grid) do |word, rel_position|
      [word, rel_position]
    end

    expect(result).to eq(expected_result)
  end

end
