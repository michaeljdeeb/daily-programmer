dice_outcomes = { 1 => 0, 2 => 0, 3 => 0, 4 => 0, 5 => 0, 6 => 0}

for i in 1..1000000
    dice_roll = rand(1..6)
    dice_outcomes[dice_roll] += 1
end

puts "#{dice_outcomes}"

# Pretty print the data
puts "# of Rolls\t 1s\t 2s\t 3s\t 4s\t 5s\t 6s\t"
puts "================================================================="
puts "10\t\t xx.xx%\t xx.xx%\t xx.xx%\t xx.xx%\t xx.xx%\t xx.xx%\t"
puts "100\t\t xx.xx%\t xx.xx%\t xx.xx%\t xx.xx%\t xx.xx%\t xx.xx%\t"
puts "1000\t\t xx.xx%\t xx.xx%\t xx.xx%\t xx.xx%\t xx.xx%\t xx.xx%\t"
puts "10000\t\t xx.xx%\t xx.xx%\t xx.xx%\t xx.xx%\t xx.xx%\t xx.xx%\t"
puts "100000\t\t xx.xx%\t xx.xx%\t xx.xx%\t xx.xx%\t xx.xx%\t xx.xx%\t"
puts "1000000\t\t xx.xx%\t xx.xx%\t xx.xx%\t xx.xx%\t xx.xx%\t xx.xx%\t"
