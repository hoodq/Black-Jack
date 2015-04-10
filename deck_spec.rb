require_relative 'deck'
require_relative 'spec_helper'

describe CardDeck do

  before do
	@deck1 = CardDeck.new
	$stdout = StringIO.new		
  end

  it "has 52 cards" do
  	@deck1.card_order.length.should == 52
  end

  it "is put in a random order after shuffle method is called" do
  	#compares the first card of two seperate decks after they have been shuffled
  	#so technically, these two cards could be the same and the test would fail but this rarely ever happens
  	deck2 = CardDeck.new

  	@deck1.shuffle
  	deck2.shuffle

  	@deck1.card_order[0].should_not == deck2.card_order[0]
  end
end