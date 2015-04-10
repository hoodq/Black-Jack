require_relative 'deck'

deck1 = Deck.new
deck1.shuffle

dealer_hand = Array.new
player_hand = Array.new

deck1.draw_card(player_hand)

deck1.draw_card(dealer_hand)

deck1.draw_card(player_hand)
puts "\nplayer's hand is: #{player_hand}"

deck1.draw_card(dealer_hand)
puts "\ndealer's first card is: #{dealer_hand[0]}"

loop do
  puts "\nwould you like to hit or stay?"
  answer = gets.chomp.downcase
	if answer == 'hit'
  	  deck1.draw_card(player_hand)
  	  puts player_hand
  	elsif answer == 'stay'
  	  puts "\nplayer's hand is: #{player_hand}"
  	  puts "\ndealer's hand is: #{dealer_hand}"
  	  break
	end
end

def hand_value
  deck1 = Deck.new

  player_hand = Array.new
  deck1.draw_card(player_hand)
end

hand_value