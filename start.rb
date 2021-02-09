require 'pry'
require_relative 'lib/luhistin.rb'

# See what's going on

str = "Terve vain sullekin, miten hurisee?"

td = Luhistin::TextDistorter
a = td::ChopWords.new
b = td::DoubleLetters.new
c = td::ShakeWords.new
d = td::ShuffleWords.new
e = td::SprinkleNumbers.new
f = td::SprinkleSpecialChars.new
g = td::BlowSpacesToText.new

#curve = [0.4, 0.3, 0.2, 0.1, 0.2, 0.3, 0.4, 0.3, 0.2, 0.1, 0.2, 0.3, 0.4, 0.3, 0.2, 0.1, 0.2, 0.3, 0.4, 0.3, 0.2, 0.1, 0.2, 0.3, 0.4]
curve = [0.1]
#curve = [0.1, 0.5, 1]
#curve = [1]

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
 puts "SprinkleNumbers"
 puts e.distort(str.dup, curve)
 puts
 puts "SprinkleSpecialChars"
 puts f.distort(str.dup, curve)
 puts
 puts "BlowSpacesToText"
 puts g.distort(str.dup, curve)
 puts
 sleep 1
end
