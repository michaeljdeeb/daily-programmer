#! /usr/bin/ruby
# Appointing Workers
# Determines which workers should be assigned to which task

# Michael J. Deeb @michaeljdeeb

worker_skills = Hash.new
number_of_jobs = 0
index = 0
jobs = Array.new

begin
    file = File.new("worker-inputs.sample", "r")
    while (line = file.gets)
        # Getting the first line input which will always be a number
        if line.to_i > 0
            number_of_jobs = line.to_i
            number_of_jobs -= 1
        end

        if index < number_of_jobs
            jobs.push(line)
            index += 1
        else
            
        end

        # This assumes we'll only get input like a=3 **not** a = 3 using .strip didn't work
        # input_split = line.strip.split('=')

    end
    file.close
rescue => file_exception
    puts "Unable to read worker-inputs.sample: #{file_exception}"
end
