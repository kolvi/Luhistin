module Luhistin
  class PropabilityCurve
  	attr_accessor :curve_y_values

  	def initialize(curve_y=nil)
  	  @curve_y_values = curve_y
  	end

	def propability_reading(x_point)
	    if (x_point == 1)
	      # Border case: for number one, return last index
	      # since using formula would return too large a value
	      the_index = @curve_y_values.length - 1
	    else
	      the_index = @curve_y_values.length * x_point
	    end
	    @curve_y_values[the_index]
	end

  end
end
