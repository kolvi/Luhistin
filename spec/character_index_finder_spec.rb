# TODO: Needed to require here?
require 'rspec'
require_relative '../lib/luhistin.rb'

# TODO: Write tests!!!!
# This is just a starting "stub".

describe Luhistin::TextTool::CharacterIndexFinder do

  it "findex character indexes for a simple string" do
    expect(subject.indexes_of("moikka", "k")).to eq([3,4])
  end

  it "findex character indexes for a string with matches at start and end" do
    expect(subject.indexes_of("pkiopikp", "p")).to eq([0,4,7])
  end

  it "returns empty list if no characters match" do
    expect(subject.indexes_of("There are no matches here\nfor the certain character", "x")).to eq([])
  end

  it "handles empty text graciously, returning no matches" do
    expect(subject.indexes_of("", "x")).to eq([])
  end


  # Error cases

  it "raises error if chr is not string" do
  	expect do
  		subject.indexes_of("text for matches", 5.82)
  	end.to raise_error(ArgumentError, "Character is not string")
  end

  it "raises error if chr is empty" do
  	expect do
  		subject.indexes_of("text for matches", "")
  	end.to raise_error(ArgumentError, "No character supplied")
  end

  it "raises error if chr is longer than one character" do
  	expect do
  		subject.indexes_of("text for matches", "xy")
  	end.to raise_error(ArgumentError, "More than one character supplied")
  end

  it "raises error if text is not string" do
  	expect do
  		subject.indexes_of(:this_aint_a_string, "x")
  	end.to raise_error(ArgumentError, "Text is not string")
  end

#

end