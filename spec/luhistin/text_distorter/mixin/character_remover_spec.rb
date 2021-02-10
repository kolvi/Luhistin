require 'luhistin'

module Luhistin
  module TextDistorter
    class SpecClassCharacterRemover < CurveDistorter
      include CharacterRemover
    end
  end
end

describe Luhistin::TextDistorter::SpecClassCharacterRemover do

  def set_mocks(canned_rand)
  	#curveclass = Luhistin::PropabilityCurve
	  subject.curve = curveclass.new([0.2, 0.4, 0.6])
	  expect_any_instance_of(curveclass).to receive(:propability_reading).and_return(0.55)
	  expect(Random).to receive(:rand).and_return(canned_rand) # use "allow" for permanent mock
  end

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

=begin
  it "sometimes passes random filter test for modifying text" do
  	set_mocks 0.4
    expect(subject.randomly_selected? :whatever).to be true
  end

  it "sometimes fails random filter test for modifying text" do
  	set_mocks 0.7
    expect(subject.randomly_selected? :whatever).to be false
  end

  it "has no curve for starters" do
  	expect(subject.curve).to eq(nil)
  end

  it "correctly creates the curve when distort called" do
	expect(Luhistin::PropabilityCurve).to receive(:new).and_return(:curve_instance) # use "allow" for permanent mock

  	subject.distort(:whatever_text, :whatever_y_values)
  	expect(subject.curve).to eq(:curve_instance)
  end
=end
end

