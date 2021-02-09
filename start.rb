require 'pry'
require_relative 'lib/luhistin.rb'

# See what's going on

str = "Terve vain sullekin, miten hurisee?"

a = Luhistin::TextDistorter::ChopWords.new
b = Luhistin::TextDistorter::DoubleLetters.new
c = Luhistin::TextDistorter::ShakeWords.new

curve = [0.8, 1]


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
 sleep 0.35
end
