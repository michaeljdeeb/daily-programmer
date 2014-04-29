#! /usr/bin/ruby
# Trigonometric Triangle Trouble
# Solves right triangle

# Michael J. Deeb @michaeljdeeb

def easy_angle (angle1, angle2)

    puts "angle1: #{angle1} angle2: #{angle2}"

    if angle1.to_i == 0 or angle2.to_i == 0
        puts "One of the angles was null"
        angle3 = nil
    else
        angle3 = ((180 - angle1) - angle2)
    end
end

triangle_inputs = Hash.new
side_count = 0
angle_count = 0

begin
    file = File.new("triangle-inputs.sample", "r")
    while (line = file.gets)
        # This assumes we'll only get input like a=3 **not** a = 3 using .strip didn't work
        input_split = line.strip.split('=')
        triangle_inputs[input_split[0]] = input_split[1].to_i
    end
    file.close
rescue => file_exception
    puts "Unable to read triangle-inputs.sample: #{file_exception}"
end

# This will always be the case so I'm just going to make sure it's set even if it's done in the text file.
triangle_inputs["C"] = 90

side_angle_list = triangle_inputs.keys
for i in 0..side_angle_list.length
    if side_angle_list[i] != nil and side_angle_list[i] == side_angle_list[i].upcase
        angle_count += 1
    elsif side_angle_list[i] != nil and side_angle_list[i] == side_angle_list[i].downcase
        side_count += 1
    end
end

puts "Sides: #{side_count} Angles: #{angle_count}"

side_exists = false

if side_count > 0
    side_exists = true

# The challenge says you'll always be given correct inputs, but thinking about the validation was fun
if triangle_inputs.length < 4 or not side_exists
    puts "Sorry, you haven't provided me enough information to construct a Euclidian right triangle."
    Kernel.exit
end