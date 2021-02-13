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
	      the_index = (@curve_y_values.length * x_point).floor
	    end
	    @curve_y_values[the_index]
	end

	def *(multiplier)
		# TODO: Make sure y is positive float/int
		mclass = multiplier.class
		raise ArgumentError, "multiplier must be float or integer" unless (mclass == Integer || mclass == Float)
		raise ArgumentError, "multiplier cannot be negative" unless (multiplier >= 0)

		@curve_y_values.map do |y|
			[y*multiplier, 1].min
		end
	end

  end
end
