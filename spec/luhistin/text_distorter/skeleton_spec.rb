require 'luhistin'

describe Luhistin::TextDistorter::Skeleton do

  def set_mocks(canned_rand)
  	  curveclass = Luhistin::PropabilityCurve
	  #subject.curve = curveclass.new([0.5, 0.3])
	  subject.curve = curveclass.new([0.2, 0.4, 0.6])
	  expect_any_instance_of(curveclass).to receive(:propability_reading).and_return(0.55)
	  expect(Random).to receive(:rand).and_return(canned_rand) # use "allow" for permanent mock
  end

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

end

