#! /usr/bin/ruby
# The Torn Number
# Checks if the number is a torn number

# Michael J. Deeb @michaeljdeeb

def torn_number_calculator(number_string)
    # Splitting the number into two parts [xx, yy]
    number_group_1 = number_string[0..1].to_i
    number_group_2 = number_string[2..3].to_i

    # Doing the calculation necessary for a torn number
    possible_torn_number = number_group_1 + number_group_2
    possible_torn_number *= possible_torn_number
    possible_torn_number = "%04d" % possible_torn_number

    # Return added for when the user enters a number and it isn't a torn number.
    puts "Checking #{possible_torn_number.to_s} vs #{number_string}"
    if possible_torn_number.to_s == number_string
        puts "#{number_string} is a torn number."
        return true
    else
        return false
    end

end

def enter_torn_number
    print "Please enter a four-digit number: "
    number_string = gets.chomp

    # This is giving me weird issues with leading zeros so I'm going to avoid this route (ex. 0123)
    # number = number.to_i

    # Validating the user input
    # TODO - This still allows non-unique inputs (ex. 0000)
    if number_string.length != 4
        puts "You didn't enter a four digit number."
        Kernel.exit
    end

    result = torn_number_calculator number_string
    if not result
        puts "#{number_string} is not a torn number."
    end

end

def calculate_torn_numbers
    for i in 0..9999
        four_digit_number = "%04d" % i

        # Skip non-unique numbers (ex. 0000)
        four_digit_number_array = four_digit_number.chars.to_a
        if four_digit_number.chars.to_a.uniq.length == 4
            # puts "Unique: #{four_digit_number}"
            torn_number_calculator four_digit_number
        end
    end
end

# Main
puts "Welcome to the torn number finder!"
puts "How would you like to proceed?"
puts "1. Let me find the torn number!"
puts "2. Find the torn numbers for me!"
print 'Enter a number (1 or 2) '

STDOUT.flush
player_choice = gets.chomp[0].to_i

if player_choice == 1
    enter_torn_number
elsif player_choice == 2
    calculate_torn_numbers
else
    puts "I'm sorry, that wasn't one of the options."
end
