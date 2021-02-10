require 'luhistin'

describe Luhistin::TextDistorter::Skeleton do

  it "is skeletal" do
    expect(1).to eq(1)
  end

  it "finds right propabilities from five-stage curve" do

  	#
  	# Results should be as following.
  	#
  	# 0 <= x_point < 0.2: 0.314
  	# 0.2 <= x_point < 0.4: 0.109
  	# 0.4 <= x_point < 0.6: 0.92
  	# 0.6 <= x_point < 0.8: 0.78
  	# 0.8 <= x_point <= 1: 0.559
  	#

  	subject.curve = [0.314, 0.109, 0.92, 0.78, 0.559]
  	#propability = subject.propability_from_curve

  	prop_zero = subject.propability_from_curve(0)
  	prop_zero_six = subject.propability_from_curve(0.6)
  	prop_zero_eight = subject.propability_from_curve(0.8)
  	prop_one = subject.propability_from_curve(1)

  	prop_zero_threeplus = subject.propability_from_curve(0.32)
  	prop_zero_sevenplus = subject.propability_from_curve(0.734)

    expect(prop_zero).to eq(0.314)
    expect(prop_zero_six).to eq(0.78)
    expect(prop_zero_eight).to eq(0.559)
    expect(prop_one).to eq(0.559)

    expect(prop_zero_threeplus).to eq(0.109)
    expect(prop_zero_sevenplus).to eq(0.78)

  end


end