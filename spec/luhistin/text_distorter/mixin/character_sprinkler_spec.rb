require 'luhistin'

module Luhistin
  module TextDistorter
    class SpecClassCharacterSprinkler < CurveDistorter
      include CharacterSprinkler
    end
  end
end

describe Luhistin::TextDistorter::SpecClassCharacterSprinkler do

  before(:each) do
    # Note: We could mock PropabilityCurve, but the result is
    # deterministic and really quite simple, so we decide not to

    subject.curve = Luhistin::PropabilityCurve.new([1, 0, 0.2, 0, 1, 0, 0.5])
  end

  it 'sprinkles characters according to the formula' do
    characters = 'xyz'.chars
    text = "-"*38  # "--------------------------------------"

    randoms = [0.01, 0.9]*999
    samples = ['z', 'y', 'x']*999

    allow(Random).to receive(:rand).and_return(*randoms)
    allow(characters).to receive(:sample).and_return(*samples)

    expected_result = "y-z-x-y-z-x------y--z--x-------y-z-x-y-z-------x--y--z-"
    expect(subject.sprinke_chars(text, characters)).to eq(expected_result)
  end

  it 'works with empty string, returning empty string' do
    expect(subject.sprinke_chars("", 'xyz'.chars)).to eq("")
  end

  it 'works with a string with length one' do
    characters = ['abc', 'defg', 'hijkl']

    allow(Random).to receive(:rand).and_return(0.5)
    allow(characters).to receive(:sample).and_return('defg')

    expect(subject.sprinke_chars("-", characters)).to eq("defg-")
  end

end

