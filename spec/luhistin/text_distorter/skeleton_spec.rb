require 'luhistin'

describe Luhistin::TextDistorter::Skeleton do

  before(:example) do
  	# Placeholder curve, values don't matter
  	subject.curve = Luhistin::PropabilityCurve.new([0.5, 0.3])
  	expect_any_instance_of(Luhistin::PropabilityCurve).to receive(:propability_reading).and_return(0.55)
  end


  it "sometimes passes random filter test for modifying text" do
    expect(Random).to receive(:rand).and_return(0.4) # use "allow" for permanent mock
    expect(subject.randomly_selected? :i_pass_whatevs).to be true
  end

  it "sometimes fails random filter test for modifying text" do
    expect(Random).to receive(:rand).and_return(0.7) # use "allow" for permanent mock
    expect(subject.randomly_selected? :i_pass_whatevs).to be false
  end

end
