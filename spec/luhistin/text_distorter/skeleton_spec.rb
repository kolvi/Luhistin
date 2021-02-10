require 'luhistin'

describe Luhistin::TextDistorter::Skeleton do

  def set_mocks(fixed_rand_value)
	  	subject.curve = Luhistin::PropabilityCurve.new([0.5, 0.3])
	  	expect_any_instance_of(Luhistin::PropabilityCurve).to receive(:propability_reading).and_return(0.55)
	    expect(Random).to receive(:rand).and_return(fixed_rand_value) # use "allow" for permanent mock
  end

  it "sometimes passes random filter test for modifying text" do
  	set_mocks 0.4
    expect(subject.randomly_selected? :i_pass_whatevs).to be true
  end

  it "sometimes fails random filter test for modifying text" do
  	set_mocks 0.7
    expect(subject.randomly_selected? :i_pass_whatevs).to be false
  end

  it "has no curve for starters" do
  	expect(subject.curve).to eq(nil)
  end

  it "correctly creates the curve when distort called" do
	expect(Luhistin::PropabilityCurve).to receive(:new).and_return(:the_new_curve) # use "allow" for permanent mock

  	subject.distort(:text_to_distort, :curve_y_values)
  	expect(subject.curve).to eq(:the_new_curve)
  end

end

