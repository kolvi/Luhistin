require 'luhistin'

module Luhistin
  module TextDistorter
    class SpecClassCharacterRemover < CurveDistorter
      include CharacterRemover
    end
  end
end

describe Luhistin::TextDistorter::SpecClassCharacterRemover do

  before(:each) do
    # Note: We could mock PropabilityCurve, but the result is
    # deterministic and really quite simple, so we decide not to

    subject.curve = Luhistin::PropabilityCurve.new([0.3])
  end

  it 'successfully removes spaces from string' do
    expect(Random).to receive(:rand).and_return(0.5, 0.1, 0.8, 0.6, 0.2)

    result = subject.remove_chars(" ", "hello world, how are you doing?")
    expect(result).to eq("helloworld, how areyou doing?")
  end

  it 'successfully removes newlines from string' do
    expect(Random).to receive(:rand).and_return(0.05, 0.6)

    result = subject.remove_chars("\n", "First line\nSecond line\nThird line")
    expect(result).to eq("First line\nSecond lineThird line")
  end

  it 'does not remove anything if there are no matches' do
    result = subject.remove_chars("x", "Sometimes there really are\nno matches")
    expect(result).to eq("Sometimes there really are\nno matches")
  end

  it 'graciously handles empty string as text' do
    result = subject.remove_chars("p", "")
    expect(result).to eq("")
  end

  #TODO: It throws error if first parameter (character) is not valid

end

