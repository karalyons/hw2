# In this assignment, you'll be using the domain model from hw1 (found in the hw1-solution.sql file)
# to create the database structure for "KMDB" (the Kellogg Movie Database).
# The end product will be a report that prints the movies and the top-billed
# cast for each movie in the database.

# To run this file, run the following command at your terminal prompt:
# `rails runner kmdb.rb`

# Requirements/assumptions
#
# - There will only be three movies in the database – the three films
#   that make up Christopher Nolan's Batman trilogy.
# - Movie data includes the movie title, year released, MPAA rating,
#   and studio.
# - There are many studios, and each studio produces many movies, but
#   a movie belongs to a single studio.
# - An actor can be in multiple movies.
# - Everything you need to do in this assignment is marked with TODO!

# Rubric
# 
# There are three deliverables for this assignment, all delivered within
# this repository and submitted via GitHub and Canvas:
# - Generate the models and migration files to match the domain model from hw1.
#   Table and columns should match the domain model. Execute the migration
#   files to create the tables in the database. (5 points)
# - Insert the "Batman" sample data using ruby code. Do not use hard-coded ids.
#   Delete any existing data beforehand so that each run of this script does not
#   create duplicate data. (5 points)
# - Query the data and loop through the results to display output similar to the
#   sample "report" below. (10 points)

# Submission
# 
# - "Use this template" to create a brand-new "hw2" repository in your
#   personal GitHub account, e.g. https://github.com/<USERNAME>/hw2
# - Do the assignment, committing and syncing often
# - When done, commit and sync a final time before submitting the GitHub
#   URL for the finished "hw2" repository as the "Website URL" for the 
#   Homework 2 assignment in Canvas

# Successful sample output is as shown:

# Movies
# ======

# Batman Begins          2005           PG-13  Warner Bros.
# The Dark Knight        2008           PG-13  Warner Bros.
# The Dark Knight Rises  2012           PG-13  Warner Bros.

# Top Cast
# ========

# Batman Begins          Christian Bale        Bruce Wayne
# Batman Begins          Michael Caine         Alfred
# Batman Begins          Liam Neeson           Ra's Al Ghul
# Batman Begins          Katie Holmes          Rachel Dawes
# Batman Begins          Gary Oldman           Commissioner Gordon
# The Dark Knight        Christian Bale        Bruce Wayne
# The Dark Knight        Heath Ledger          Joker
# The Dark Knight        Aaron Eckhart         Harvey Dent
# The Dark Knight        Michael Caine         Alfred
# The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
# The Dark Knight Rises  Christian Bale        Bruce Wayne
# The Dark Knight Rises  Gary Oldman           Commissioner Gordon
# The Dark Knight Rises  Tom Hardy             Bane
# The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
# The Dark Knight Rises  Anne Hathaway         Selina Kyle

# Delete existing data, so you'll start fresh each time this script is run.
# Use `Model.destroy_all` code.

# Generate models and tables, according to the domain model.
# TODO!

Movie.destroy_all
Studio.destroy_all
Actor.destroy_all
Role.destroy_all

# Insert data into the database that reflects the sample data shown above.
# Do not use hard-coded foreign key IDs.
# TODO!

new_studio = Studio.new
new_studio["name"] = "Warner Bros."
new_studio.save

warner_bros = Studio.find_by({"name" => "Warner Bros."})

new_movie = Movie.new
new_movie["title"] = "Batman Begins"
new_movie["year_released"] = "2005"
new_movie["rated"] = "PG-13"
new_movie["studio_id"] = warner_bros["name"]
new_movie.save

new_movie = Movie.new
new_movie["title"] = "The Dark Knight"
new_movie["year_released"] = "2008"
new_movie["rated"] = "PG-13"
new_movie["studio_id"] = warner_bros["name"]
new_movie.save

new_movie = Movie.new
new_movie["title"] = "The Dark Knight Rises"
new_movie["year_released"] = "2012"
new_movie["rated"] = "PG-13"
new_movie["studio_id"] = warner_bros["name"]
new_movie.save

actor = Actor.new
actor["name"] = "Christian Bale"
actor.save

actor = Actor.new
actor["name"] = "Michael Caine"
actor.save

actor = Actor.new
actor["name"] = "Liam Neeson"
actor.save

actor = Actor.new
actor["name"] = "Katie Holmes"
actor.save

actor = Actor.new
actor["name"] = "Gary Oldman"
actor.save

actor = Actor.new
actor["name"] = "Heath Ledger"
actor.save

actor = Actor.new
actor["name"] = "Aaron Eckhart"
actor.save

actor = Actor.new
actor["name"] = "Maggie Gyllenhaal"
actor.save

actor = Actor.new
actor["name"] = "Tom Hardy"
actor.save

actor = Actor.new
actor["name"] = "Joseph Gordon-Levitt"
actor.save

actor = Actor.new
actor["name"] = "Anne Hathaway"
actor.save

#roles
bruce_wayne = Actor.find_by({"name" => "Christian Bale"})
alfred = Actor.find_by({"name" => "Michael Caine"})
ra = Actor.find_by({"name" => "Liam Neeson"})
rachel_1 = Actor.find_by({"name" => "Katie Holmes"})
commissioner = Actor.find_by({"name" => "Gary Oldman"})
joker = Actor.find_by({"name" => "Health Ledger"})
harvey = Actor.find_by({"name" => "Aaron Eckhart"})
rachel_2 = Actor.find_by({"name" => "Maggie Gyllenhaal"})
bane = Actor.find_by({"name" => "Tom Hardy"})
john_blake = Actor.find_by({"name" => "John Blake"})
selina_kyl = Actor.find_by({"name" => "Anne Hathaway"})


#movies
batman_begins = Movie.find_by({"name" => "Batman Begins"})
dark_knight = Movie.find_by({"name" => "The Dark Knight"})
dark_knight_rises = Movie.find_by({"name" => "The Dark Knight Rises"})

#Bruce Wayne
role = Role.new
role["character_name"] = "Bruce Wayne"
role["movie_id"] = batman_begins["id"]
role["actor_id"] = bruce_wayne["id"]
role.save

role = Role.new
role["character_name"] = "Bruce Wayne"
role["movie_id"] = dark_knight["id"]
role["actor_id"] = bruce_wayne["id"]
role.save

role = Role.new
role["character_name"] = "Bruce Wayne"
role["movie_id"] = dark_knight_rises["id"]
role["actor_id"] = bruce_wayne["id"]
role.save

#alfred
role = Role.new
role["character_name"] = "Alfred"
role["movie_id"] = batman_begins["id"]
role["actor_id"] = alfred["id"]
role.save

role = Role.new
role["character_name"] = "Alfred"
role["movie_id"] = dark_knight["id"]
role["actor_id"] = alfred["id"]
role.save

#Ra's Al Ghul
role = Role.new
role["character_name"] = "Ra's Al Ghul"
role["movie_id"] = batman_begins["id"]
role["actor_id"] = ra["id"]
role.save

#Rachel - Katie
role = Role.new
role["character_name"] = "Rachel Dawes"
role["movie_id"] = batman_begins["id"]
role["actor_id"] = rachel_1["id"]
role.save

#Rachel - Maggie
role = Role.new
role["character_name"] = "Rachel Dawes"
role["movie_id"] = dark_knight["id"]
role["actor_id"] = rachel_2["id"]
role.save

#Commissioner Gordon
role = Role.new
role["character_name"] = "Commissioner Gordon"
role["movie_id"] = batman_begins["id"]
role["actor_id"] = commissioner["id"]
role.save

role = Role.new
role["character_name"] = "Commissioner Gordon"
role["movie_id"] = dark_knight_rises["id"]
role["actor_id"] = commissioner["id"]
role.save

#Joker
role = Role.new
role["character_name"] = "Joker"
role["movie_id"] = dark_knight["id"]
role["actor_id"] = joker["id"]
role.save

#Harvey Dent
role = Role.new
role["character_name"] = "Harvey Dent"
role["movie_id"] = dark_knight["id"]
role["actor_id"] = harvey["id"]
role.save

#Harvey Dent
role = Role.new
role["character_name"] = "Harvey Dent"
role["movie_id"] = dark_knight["id"]
role["actor_id"] = harvey["id"]
role.save

#Bane
role = Role.new
role["character_name"] = "Bane"
role["movie_id"] = dark_knight_rises["id"]
role["actor_id"] = bane["id"]
role.save

#John Blake
role = Role.new
role["character_name"] = "John Bake"
role["movie_id"] = dark_knight_rises["id"]
role["actor_id"] = john_blake["id"]
role.save


#Selina Kyl
role = Role.new
role["character_name"] = "Selina Kyl"
role["movie_id"] = dark_knight_rises["id"]
role["actor_id"] = selina_kyl["id"]
role.save

#puts "studios: #{Studio.all.count}"
#puts "movies: #{Movie.all.count}"
#puts "Actors: #{Actor.all.count}"
#puts "Roles: #{Role.all.count}"

# Prints a header for the movies output
puts "Movies"
puts "======"
puts ""

# movies = Movie.all
# for movie in movies  
#     title = movie["title"]
#     year_released = movie["year_released"]
#     rated = movie["rated"]

# studios = Studio.find_by({"id" => movie["studio_id"]})
#     studio_name = studios["name"]

# puts "#{title}        #{year_released}          #{rated}          #{studio_name}"
# end

# Query the movies data and loop through the results to display the movies output.
# TODO!

# Prints a header for the cast output
puts ""
puts "Top Cast"
puts "========"
puts ""

# roles = Role.all
# for role in roles
#     role_name = role["character_name"]
#     actor = Actor.find_by({"id" => role["actor_id"]})
#     actor_name = actor["name"]

#     movie = Movie.find_by({"id" => role["movie_id"]})
#     movie_title = movie["title"]

# puts "#{movie_title}        #{actor_name}       #{role_name}"
# end

# Query the cast data and loop through the results to display the cast output for each movie.
# TODO!
