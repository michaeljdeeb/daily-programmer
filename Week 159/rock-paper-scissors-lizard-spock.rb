#! /usr/bin/ruby
# Rock Paper Scissors Lizard Spock
# AI chooses randomly

# Michael J. Deeb @michaeljdeeb

rpsls_hash = { 1 => "Rock", 2 => "Paper", 3 => "Scissors", 4 => "Lizard", 5 => "Spock" }

puts 'Please pick one of the following'
puts '1. Rock'
puts '2. Paper'
puts '3. Scissors'
puts '4. Lizard'
puts '5. Spock'
print 'Enter a number (1-5) '

STDOUT.flush
player_choice = gets.chomp.to_i
puts "Player picks: #{rpsls_hash[player_choice]}"
