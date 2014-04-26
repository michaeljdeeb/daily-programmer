#! /usr/bin/ruby
# Rock Paper Scissors Lizard Spock
# AI chooses randomly

# Michael J. Deeb @michaeljdeeb

RPSLS_ARRAY = [ "Rock", "Paper", "Scissors", "Lizard", "Spock" ]
VERB_ARRAY = [ "cut", "covers", "crushes", "poisons", "smashes", "decapitate", "eats", "disproves", "vaporizes", "ties" ]

# 2D array time [player, computer, verb]
RPSLS_MATRIX = [[0,0,9], [-1,1,1], [1,-1,2], [1,-1,2], [-1,1,8],
                [1,-1,1], [0,0,9], [-1,1,0], [-1,1,6], [1,-1,7],
                [-1,1,2], [1,-1,0], [0,0,9], [1,-1,5], [-1,1,4],
                [-1,1,2], [1,-1,6], [-1,1,5], [0,0,9], [1,-1,3],
                [1,-1,8], [-1,1,7], [1,-1,4], [-1,1,3], [0,0,9]]

player_wins = 0
computer_wins = 0
ties = 0
total_games_played = 0

play_again = true

while play_again do
    puts 'Please pick one of the following'
    puts '1. Rock'
    puts '2. Paper'
    puts '3. Scissors'
    puts '4. Lizard'
    puts '5. Spock'
    print 'Enter a number (1-5) '

    STDOUT.flush
    # TODO - There should be more error handling here while(!player_choice.is_a? Integer)
    # TODO - Just use a regex on the input.
    player_choice = gets.chomp.to_i - 1
    puts "Player picks: #{RPSLS_ARRAY[player_choice]}"

    computer_choice = rand(0..4)
    puts "Computer picks: #{RPSLS_ARRAY[computer_choice]}"
    puts ''

    outcome = RPSLS_MATRIX[player_choice + (computer_choice * 5)]
    if outcome[1] == 1
        puts "Player wins!"
        player_wins += 1
        puts "#{RPSLS_ARRAY[player_choice]} #{VERB_ARRAY[outcome[2]]} #{RPSLS_ARRAY[computer_choice]}"
    elsif outcome[0] == 1
        puts "Computer wins!"
        computer_wins += 1
        puts "#{RPSLS_ARRAY[computer_choice]} #{VERB_ARRAY[outcome[2]]} #{RPSLS_ARRAY[player_choice]}"
    else
        puts "Tie!"
        ties += 1
        puts "#{RPSLS_ARRAY[player_choice]} #{VERB_ARRAY[outcome[2]]} #{RPSLS_ARRAY[computer_choice]}"
    end

    total_games_played += 1

    player_wins_percent = (player_wins / total_games_played.to_f) * 100.0
    computer_wins_percent = (computer_wins / total_games_played.to_f) * 100.0
    ties_percent = (ties / total_games_played.to_f) * 100.0

    puts ''
    puts '------------------------------'
    puts 'Current Summary:'
    puts '------------------------------'
    puts "Player Wins: #{player_wins} | #{player_wins_percent.round(2)}%"
    puts "Computer Wins: #{computer_wins} | #{computer_wins_percent.round(2)}%"
    puts "Ties: #{ties} | #{ties_percent.round(2)}%"
    puts '------------------------------'
    puts "Total Games Played: #{total_games_played}"
    puts '------------------------------'

    puts ''
    print 'Would you like to play again? (Y/N) '
    play_again_input = gets.chomp[0].downcase

    # Might as well stop the game for anything but a 'y'
    if(play_again_input != 'y')
        play_again = false
    end
end
