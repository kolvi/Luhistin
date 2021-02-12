require 'luhistin'

module Luhistin
  module TextDistorter
    class SpecClassWordTraverser < CurveDistorter
      include WordTraverser
    end
  end
end

# Note: This is more of a simple integration test,
# since CurveDistorter, as well as WordGridCreator and
# WordGridTraverser (used by WordTraverser)
# have their own unit tests

describe Luhistin::TextDistorter::SpecClassWordTraverser do

  before(:each) do
    # Note: We could mock PropabilityCurve, but the result is
    # deterministic and really quite simple, so we decide not to

    subject.curve = Luhistin::PropabilityCurve.new([0.5])
  end

  it 'traverses a short string word, calling block for modifications' do
    allow(Random).to receive(:rand).and_return(*[0.2, 0.8]*999)

    text = "Here are some words"
    result = subject.modify_some_words(text) do |word|
      "---#{word}+++"
    end
    expect(result).to eq("---Here+++ are ---some+++ words")
  end

  it 'does not panic if string is empty' do
    expect(subject.modify_some_words("")).to eq("")
  end

  it 'does not fail for one word string' do
    allow(Random).to receive(:rand).and_return(0.9)
    expect(subject.modify_some_words("hello")).to eq("hello")
  end

end

