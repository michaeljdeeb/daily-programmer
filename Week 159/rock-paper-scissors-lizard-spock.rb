#! /usr/bin/ruby
# Rock Paper Scissors Lizard Spock
# AI chooses randomly

# Michael J. Deeb @michaeljdeeb

RPSLS_ARRAY = [ "Rock", "Paper", "Scissors", "Lizard", "Spock" ]
VERB_ARRAY = [ "cut", "covers", "crushes", "poisons", "smashes", "decapitate", "eats", "disproves", "vaporizes", "ties" ]

puts 'Please pick one of the following'
puts '1. Rock'
puts '2. Paper'
puts '3. Scissors'
puts '4. Lizard'
puts '5. Spock'
print 'Enter a number (1-5) '

STDOUT.flush
# TODO - There should be more error handling here while(!player_choice.is_a? Integer)
player_choice = gets.chomp.to_i - 1
puts "Player picks: #{RPSLS_ARRAY[player_choice]}"

computer_choice = rand(0..4)
puts "Computer picks: #{RPSLS_ARRAY[computer_choice]}"
puts ''

# 2D array time [player, computer, verb]
RPSLS_MATRIX = [[0,0,9], [-1,1,1], [1,-1,2], [1,-1,2], [-1,1,8],
                [1,-1,1], [0,0,9], [-1,1,0], [-1,1,6], [1,-1,7],
                [-1,1,2], [1,-1,0], [0,0,9], [1,-1,5], [-1,1,4],
                [-1,1,2], [1,-1,6], [-1,1,5], [0,0,9], [1,-1,3],
                [1,-1,8], [-1,1,7], [1,-1,4], [-1,1,3], [0,0,9]]

outcome = RPSLS_MATRIX[player_choice + (computer_choice * 5)]
if outcome[1] == 1
    puts "Player wins!"
    puts "#{RPSLS_ARRAY[player_choice]} #{VERB_ARRAY[outcome[2]]} #{RPSLS_ARRAY[computer_choice]}"
elsif outcome[0] == 1
    puts "Computer wins!"
    puts "#{RPSLS_ARRAY[computer_choice]} #{VERB_ARRAY[outcome[2]]} #{RPSLS_ARRAY[player_choice]}"
else
    puts "Tie!"
    puts "#{RPSLS_ARRAY[player_choice]} #{VERB_ARRAY[outcome[2]]} #{RPSLS_ARRAY[computer_choice]}"
end
