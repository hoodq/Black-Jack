require_relative 'deck'

deck1 = Deck.new

dealer_hand = Array.new
player_hand = Array.new

@card_value = {2 => 2, 3 => 3, 4 => 4, 5 => 5, 6 => 6, 7 => 7, 8 => 8, 9 => 9, 10 => 10, jack: 10, queen: 10, king: 10, ace: 11}

#this method isn't quite right
#whenever an ace that is valued at 11 does not set the hand value over 21, then it registers as an 11
#need to change it so that if a subsequent card pushes the value over 21, then the ace changes to a value of 1
def value_hand hand
  value = 0
  hand.each do |card|
    if card[0] == :ace
      value += @card_value[card[0]]
      if value > 21
        value -= 10
      end  
    else
      value += @card_value[card[0]]    
    end
  end
  value
end

deck1.shuffle

deck1.draw_card(player_hand)

deck1.draw_card(dealer_hand)

deck1.draw_card(player_hand)
puts "\nplayer's hand is: #{player_hand}"
sleep(2)

deck1.draw_card(dealer_hand)
puts "\ndealer's first card is: #{dealer_hand[0]}"
sleep(2)

player_value = 0

loop do
  player_value = value_hand(player_hand)
  if player_value > 21
    puts "\n#{player_value}. Player busted."
    sleep(2)
    break
  end
  puts "\nWould you like to hit or stay?"
  answer = gets.chomp.downcase
	if answer == 'hit'
 	  deck1.draw_card(player_hand)
 	  puts "Player's hand is: #{player_hand}"
    sleep(2)
  elsif answer == 'stay'
	  break
	end
end

if player_value <= 21
  dealer_value = 0

  dealer_value = value_hand(dealer_hand)

  player_value = value_hand(player_hand)

  while dealer_value < 17
    dealer_value = 0
    puts "\nDealer must hit"
    deck1.draw_card(dealer_hand)
    dealer_value = value_hand(dealer_hand)
    sleep(2)
  end

  puts "\nDealer's hand is: #{dealer_hand}"
  puts "\nwith a value of: #{dealer_value}"
  sleep(2)
  puts "\nPlayer's hand is: #{player_hand}"
  puts "\nwith a value of: #{player_value}"
  sleep(2)

  if (dealer_value > player_value) && (dealer_value <= 21) || (player_value > 21 && dealer_value <= 21) 
    puts "\nDealer wins"
  elsif ((player_value > dealer_value) && (player_value <= 21)) || (dealer_value > 21 && player_value <= 21) 
    puts "\nPlayer wins"
  else
    puts "\nPush"
  end
end