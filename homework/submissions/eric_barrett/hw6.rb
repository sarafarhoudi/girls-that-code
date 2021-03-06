# Homework Assignment #6
# Using loops and if statements to make decisions
# 
# For this homework assignment we'll use the CSV file: makler_november.csv 
# which lists details about property for sale and rent in november from Makler

# - if you need help with arrays, try here: http://www.ruby-doc.org/core-2.1.3/Array.html
# - if you need help with loading the csv, try here: http://ruby-doc.org/stdlib-2.1.3/libdoc/csv/rdoc/CSV.html

##################
#### IMPORTANT: after each step, use a puts statement to write out the variable(s) that you just created, like:
#### puts "new_poem = #{new_poem}"
#### 
#### It will also be good to use a puts statement as a separator between each step, like:
#### puts "------------------"
#### puts "----- Step 3 -----"
#### puts "------------------"
####
#### These are not required, but it does help make it easier to look at your output and know what your are looking at.
##################


###
# 1. First things first: let's load the makler CSV file.
# - you will find makler_november.csv, in the notes folder. Make sure you copy it in the same folder where this Ruby file (the one you're reading right now!) is.
# - don't forget to import the 'csv' Ruby library
# - the makler_november has a line of headers. Make sure to take this into consideration, when you read the file.
# - store the content of the file in a variable called 'posts'

require 'csv'
file = File.open('makler_november.csv', 'r').read
posts = CSV.parse(file, headers: true)
puts posts.length
puts ""
puts "========================"
puts ""

# 2. 
# Create a variable called 'posts_garages' that only contains posts with garages.

posts_garages = posts.select { |post| post[39].to_i >= 1 }
puts posts_garages.length
puts ""
puts "========================"
puts ""

# 3. 
# For each of the posts in 'posts_garages', write to the screen the posting_id and the number of bedrooms
# if the post is an apartment. If it is not an apartment, write to the screen the posting_id and the phrase 'Does not meet requirements.'
# Ex. "ID: 10016461, # Garages: 3 " or "ID: 10016461, Does not meet requirements."

posts_garages.each do |post|
  if post[2] == "apartment"
    puts "ID: #{post[0]}, Bedrooms: #{post[25]}"
  else
   puts "ID: #{post[0]}, Message: Does not meet requirements." 
  end
end
puts ""
puts "========================"
puts ""


# 4 BONUS QUESTION
# You are a very superstitious person and are only looking for apartments with 'posting_id's that end
# with the number '3'. Create a subset of 'posts' that have a garage,  3 bedrooms, is an apartment,
# and the last digit of the 'posting id' is the number '3'. Assign that subset to the variable 'posts_three'.
# For each post in that list, write to the screen the 'posting_id' and the number of bedrooms if and only if
# the apartment is located in Tbilisi. Do that in a pretty way.

# posts_three = posts.select { |post| post[39].to_i <= 1 && post[25].to_i == 3 && post[2] == "apartment" && post[0][-1] == "3"  }
posts_three = posts_garages.select { |post| post[25].to_i == 3 && post[2] == "apartment" && post[0].split('').last == "3"  }


posts_three.each do |post|
  if post[18] == "Tbilisi"
    puts "ID: #{post[0]}, Bedrooms: #{post[25]}"
  end
end

puts posts_garages.length
