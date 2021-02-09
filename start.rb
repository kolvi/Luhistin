require 'pry'
require_relative 'lib/luhistin.rb'

# See what's going on

x = Luhistin::TextDistorter::ChopWords.new
str = "Terve vain sullekin, miten hurisee?"
curve = [0.8, 1]
binding.pry
