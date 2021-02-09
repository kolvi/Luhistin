require 'pry'
require_relative 'lib/luhistin.rb'

# See what's going on

str = "Terve vain sullekin, miten hurisee?"

td = Luhistin::TextDistorter
a = td::ChopWords.new
b = td::DoubleLetters.new
c = td::ShakeWords.new
d = td::ShuffleWords.new

curve = [0.4]


while true do
 system("clear")
 puts "ChopWords"
 puts a.distort(str.dup, curve)
 puts
 puts "DoubleLetters"
 puts b.distort(str.dup, curve)
 puts
 puts "ShakeWords"
 puts c.distort(str.dup, curve)
 puts
 puts "ShuffleWords"
 puts d.distort(str.dup, curve)
 puts
 sleep 1
end
