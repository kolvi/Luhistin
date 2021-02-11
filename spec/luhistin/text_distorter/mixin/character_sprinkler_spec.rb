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

    subject.curve = Luhistin::PropabilityCurve.new([0.3])
  end

  it 'blaahhhhhhhhhhhhhhh' do
    expect(1).to eq(1)
  end

end

