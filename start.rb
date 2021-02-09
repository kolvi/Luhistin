require 'pry'
require_relative 'lib/luhistin.rb'

# See what's going on

x = Luhistin::TextDistorter::DoubleLetters.new
str = "abcd efgh ijklmn opqr"
curve = [0.8, 1]
binding.pry
