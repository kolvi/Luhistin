require 'luhistin'

describe Luhistin::PropabilityCurve do
  it "finds right propabilities from one-value curve" do
    #
    # Results should be as following.
    #
    # 0 <= x_point <= 1: 0.6
    #
    subject.curve_y_values = [0.6]
    result_a = subject.propability_from_curve(0)
    result_b = subject.propability_from_curve(1)
    result_c = subject.propability_from_curve(0.47)

    expect(result_a).to eq(0.6)
    expect(result_b).to eq(0.6)
    expect(result_c).to eq(0.6)
  end

  it "finds right propabilities from two-value curve" do
    #
    # Results should be as following.
    #
    # 0 <= x_point < 0.5: 0.2
    # 0.5 <= x_point <= 1: 1
    #

    subject.curve_y_values = [0.2, 1]
    result_a = subject.propability_from_curve(0)
    result_b = subject.propability_from_curve(0.5)
    result_c = subject.propability_from_curve(1)
    result_d = subject.propability_from_curve(0.298)

    expect(result_a).to eq(0.2)
    expect(result_b).to eq(1)
    expect(result_c).to eq(1)
    expect(result_d).to eq(0.2)
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

    subject.curve_y_values = [0.314, 0.109, 0.92, 0.78, 0.559]

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
