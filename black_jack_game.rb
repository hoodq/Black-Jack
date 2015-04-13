require_relative 'deck'

deck1 = Deck.new
deck1.shuffle

dealer_hand = Array.new
player_hand = Array.new

card_value = Hash.new
card_value[2] = 2
card_value[3] = 3
card_value[4] = 4
card_value[5] = 5
card_value[6] = 6
card_value[7] = 7
card_value[8] = 8
card_value[9] = 9
card_value[10] = 10
card_value[:jack] = 10
card_value[:queen] = 10
card_value[:king] = 10
card_value[:ace] = [11, 1]

deck1.draw_card(player_hand)

deck1.draw_card(dealer_hand)

deck1.draw_card(player_hand)
puts "\nplayer's hand is: #{player_hand}"
sleep(3)

deck1.draw_card(dealer_hand)
puts "\ndealer's first card is: #{dealer_hand[0]}"
sleep(3)

loop do
  puts "\nwould you like to hit or stay?"
  answer = gets.chomp.downcase
	if answer == 'hit'
  	  deck1.draw_card(player_hand)
  	  puts "Player's hand is: #{player_hand}"
      sleep(3)
  	elsif answer == 'stay'
  	  puts "\nplayer's hand is: #{player_hand}"
  	  puts "\ndealer's hand is: #{dealer_hand}"
  	  break
	end
end

dealer_value = 0

dealer_hand.each do |card|
  if card[0] == :ace && dealer_value > 21
    
  end
  dealer_value += card_value[card[0]]
end

player_value = 0

player_hand.each do |card|
  player_value += card_value[card[0]]
end

while dealer_value < 17
  dealer_value = 0
  puts "\nDealer must hit"
  deck1.draw_card(dealer_hand)
  dealer_hand.each do |card|
    dealer_value += card_value[card[0]]
  end
end

puts "\nDealer's hand is: #{dealer_hand}"
puts "\nwith a value of: #{dealer_value}"
puts "\nPlayer's hand is: #{player_hand}"
puts "\nwith a value of: #{player_value}"

if (dealer_value > player_value) && (dealer_value <= 21) || (player_value > 21 && dealer_value <= 21) 
  puts "\nDealer wins"
elsif ((player_value > dealer_value) && (player_value <= 21)) || (dealer_value > 21 && player_value <= 21) 
  puts "\nPlayer wins"
else
  puts "\nPush"
end