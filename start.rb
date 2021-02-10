require 'pry'
require_relative 'lib/luhistin.rb'

# See what's going on

str = "Terve vain sullekin, miten hurisee?"

td = Luhistin::TextDistorter
a = td::ChopWords.new
b = td::DoubleLetters.new
c = td::ShakeWords.new
d = td::ShuffleWords.new
e = td::RemoveNewlines.new
f = td::RemoveSpaces.new

g = td::SprinkleNumbers.new
h = td::SprinkleSpecialChars.new
i = td::BlowSpacesToText.new

curve = [0.4, 0.3, 0.2, 0.1, 0.2, 0.3, 0.4, 0.3, 0.2, 0.1, 0.2, 0.3, 0.4, 0.3, 0.2, 0.1, 0.2, 0.3, 0.4, 0.3, 0.2, 0.1,
         0.2, 0.3, 0.4]
# curve = [0.1]
# curve = [0.1, 0.5, 1]
# curve = [1]

# binding.pry

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
  puts "RemoveNewlines"
  puts e.distort(str.dup, curve)
  puts
  puts "RemoveSpaces"
  puts f.distort(str.dup, curve)
  puts
  puts "SprinkleNumbers"
  puts g.distort(str.dup, curve)
  puts
  puts "SprinkleSpecialChars"
  puts h.distort(str.dup, curve)
  puts
  puts "BlowSpacesToText"
  puts i.distort(str.dup, curve)
  puts
  sleep 1
end
