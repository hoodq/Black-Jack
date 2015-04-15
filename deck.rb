class Deck
  attr_reader :card_order, :hand
  
  def initialize
    @hearts = [ [2, :hearts],
                [3, :hearts],
                [4, :hearts],
                [5, :hearts],
                [6, :hearts],
                [7, :hearts],
                [8, :hearts],
                [9, :hearts],
                [10, :hearts],
                [:jack, :hearts],
                [:queen, :hearts],
                [:king, :hearts],
                [:ace, :hearts]
                ]

    @spades = [ [2, :spades],
                [3, :spades],
                [4, :spades],
                [5, :spades],
                [6, :spades],
                [7, :spades],
                [8, :spades],
                [9, :spades],
                [10, :spades],
                [:jack, :spades],
                [:queen, :spades],
                [:king, :spades],
                [:ace, :spades]
                ]

    @diamonds = [ [2, :diamonds],
                  [3, :diamonds],
                  [4, :diamonds],
                  [5, :diamonds],
                  [6, :diamonds],
                  [7, :diamonds],
                  [8, :diamonds],
                  [9, :diamonds],
                  [10, :diamonds],
                  [:jack, :diamonds],
                  [:queen, :diamonds],
                  [:king, :diamonds],
                  [:ace, :diamonds]
                  ]

    @clubs = [ [2, :clubs],
               [3, :clubs],
               [4, :clubs],
               [5, :clubs],
               [6, :clubs],
               [7, :clubs],
               [8, :clubs],
               [9, :clubs],
               [10, :clubs],
               [:jack, :clubs],
               [:queen, :clubs],
               [:king, :clubs],
               [:ace, :clubs]
               ]

    @card_order = @hearts + @spades + @diamonds + @clubs
  end
  
  def shuffle
    max = 51
    shuffled_deck = Array.new
    
    while max >= 0
      rand_card_index = rand(0..max)
      shuffled_deck.push(@card_order[rand_card_index])
      @card_order.delete_at(rand_card_index)
      max -= 1
    end
    @card_order = shuffled_deck
  end

  def cut
    puts "pick a card number from 1 to 52 where the deck will be cut"
    #inputting a 1 here leaves the deck as is
    card_index = gets.chomp.to_i - 1

    if card_index >= 1 && card_index < 53
      second_half = @card_order.drop(card_index)
      first_half = @card_order - second_half
      @card_order = second_half + first_half
    else
      cut
    end
  end

  def draw_card hand
    @card = @card_order[0]
    @card_order.delete_at(0)
    hand.push(@card)
  end

  def to_s
    @card_order
  end
end

if __FILE__ == $0
  deck1 = Deck.new
  hand = Array.new

  deck1.shuffle
  deck1.cut
  puts deck1.draw_card(hand)
  puts deck1.draw_card(hand)
  puts deck1.card_order.length
  deck1.to_s
end

