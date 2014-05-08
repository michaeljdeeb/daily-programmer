#! /usr/bin/ruby
# Trigonometric Triangle Trouble
# Solves right triangle

# Michael J. Deeb @michaeljdeeb

# Let's create 1 deck here and we'll make more if necessary later.
deck_array = Array.new
for card in 1..13
    for suite in 1..4
        deck_array.push([card, suite])
    end
end

print "How many decks of cards would you like to use? (1-10) "
decks = gets.chomp.to_i

if decks > 10 or decks < 1
    puts "That doesn't look like a number in the range."
    Kernel.exit
end

# puts "Deck: #{deck_array}"

multi_deck = Array.new
i = 0
while i < decks
    multi_deck += deck_array
    i += 1
end

# puts "Decks: #{multi_deck}"

total_cards = multi_deck.length

total_blackjacks = 0
# blackjack_hands = Array.new
total_hands = 0
while multi_deck.length != 0
    # Select two cards
    card_one_index = rand(1..multi_deck.length) - 1
    card_one = multi_deck[card_one_index]
    multi_deck.delete_at(card_one_index)
    multi_deck.compact

    card_two_index = rand(1..multi_deck.length) - 1
    card_two = multi_deck[card_two_index]
    multi_deck.delete_at(card_two_index)
    multi_deck.compact

    # Check if blackjack!
    card_one_value = 0
    card_one[0] > 10 ? card_one_value = 10 : card_one_value = card_one[0]
    card_one_value = 11 if card_one_value == 1

    card_two_value = 0
    card_two[0] > 10 ? card_two_value = 10 : card_two_value = card_two[0]
    card_two_value = 11 if card_two_value == 1

    # Dealing with aces
    card_two_value = 1 if card_one_value == 1 and card_two_value == 1

    hand_value = card_one_value + card_two_value
    # BLACKJACK!
    if hand_value == 21
        total_blackjacks += 1
    end

    puts "Hand ##{total_hands} | Card 1: #{card_one} Card 2: #{card_two} Value: #{card_one_value + card_two_value}| Array Length: #{multi_deck.length}"
    total_hands += 1
end
blackjack_percent = (total_blackjacks / total_hands.to_f) * 100.0
blackjack_percent = "%.2f" % blackjack_percent
puts "After #{total_hands} hands there were #{total_blackjacks} at #{blackjack_percent}%"
