DATAPOINTS = [10, 100, 1000, 10000, 100000, 1000000]
dice_outcomes = { 1 => 0, 2 => 0, 3 => 0, 4 => 0, 5 => 0, 6 => 0}

# [length, 1s, 1s%, 2s, 2s%, 3s, 3s%, 4s, 4s%, 5s, 5s%, 6s, 6s%]
data_milestones = Array.new

for i in 1..1000000
    dice_roll = rand(1..6)
    dice_outcomes[dice_roll] += 1

    if DATAPOINTS.include? i
        data_milestones.push([i, dice_outcomes[1], (dice_outcomes[1]/i.to_f)*100, dice_outcomes[2], (dice_outcomes[2]/i.to_f)*100, dice_outcomes[3], (dice_outcomes[3]/i.to_f)*100, dice_outcomes[4], (dice_outcomes[4]/i.to_f)*100, dice_outcomes[5], (dice_outcomes[5]/i.to_f)*100, dice_outcomes[6], (dice_outcomes[6]/i.to_f)*100])
    end
end

# Pretty print the data
puts "# of Rolls\t 1s\t 2s\t 3s\t 4s\t 5s\t 6s\t"
puts "================================================================="
for i in 0..(data_milestones.length-1)
    puts "#{data_milestones[i][0]}\t\t #{data_milestones[i][2].round(2)}%\t #{data_milestones[i][4].round(2)}%\t #{data_milestones[i][6].round(2)}%\t #{data_milestones[i][8].round(2)}%\t #{data_milestones[i][10].round(2)}%\t #{data_milestones[i][12].round(2)}%\t"
end
