require_relative 'deck'

deck1 = Deck.new

dealer_hand = Array.new
player_hand = Array.new

@card_value = {2 => 2, 3 => 3, 4 => 4, 5 => 5, 6 => 6, 7 => 7, 8 => 8, 9 => 9, 10 => 10, jack: 10, queen: 10, king: 10, ace: 11}

#When an ace comes up, things can get a little tricky
#aces keeps track of all the aces drawn as the each method iterates through the hand
#when, the iteration is finished, the method is prompted to see if the hand contains an ace of some sort
#if this is the case, it enters a while loop that checks to see if the current value is over 21
#if so, subtracts 10 from the value to make that ace worth 1 instead of 11
#theoretically, if a hand contained the four aces and nothing else, the first ace would register as an 11
# but the next three would register as 1 a piece because the total value would exceed 21 otherwise
def value_hand hand
  value = 0
  aces = 0
  hand.each do |card|
    value += @card_value[card[0]]
    if card[0] == :ace
    aces += 1
    end
  end
  if hand.include?([:ace, :spades]) || hand.include?([:ace, :hearts]) || hand.include?([:ace, :clubs]) || hand.include?([:ace, :diamonds]) 
    while aces > 0
      if value <= 21
        break
      end
      value -= 10
      aces -= 1
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
    puts "\nDealer's hand is #{dealer_hand}"
    sleep(1)
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