require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef") }
  subject { Dessert.new("lemon", 10, "Gary") }
  describe "#initialize" do

    it "sets a type" do
      expect(subject.type).to eq("lemon")
    end
    it "sets a quantity" do
      expect(subject.quantity).to eq(10)
    end
    it "starts ingredients as an empty array" do
      expect(subject.ingredients).to eq([])
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("lemon", "key", chef)}.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    before(:each) do
      subject.add_ingredient('pickles')
    end
    it "adds an ingredient to the ingredients array" do
      expect(subject.ingredients).to include('pickles')
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      expect(subject.mix!).to match_array(subject.ingredients)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      expect(subject.eat(4)).to eq(subject.quantity)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect {subject.eat(11) }.to raise_error('not enough left!')
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:name).and_return("Gary")
      expect(subject.serve).to include(chef.name)
    end
  end

  describe "#make_more" do
    let(:chef) { double('chef') }
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with("lemon")
      subject.make_more
    end
  end
end
