require 'pry'
require_relative 'lib/luhistin.rb'

# See what's going on

x = Luhistin::TextDistorter::RemoveNewlines.new
str = "a\nb\nc\nd\ne\na\nb\nc\nd\ne\na\nb\nc\nd\ne\n"
binding.pry
