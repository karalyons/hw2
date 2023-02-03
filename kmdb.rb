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

new_movie1 = Movie.new
new_movie1["title"] = "Batman Begins"
new_movie1["year_released"] = "2005"
new_movie1["rated"] = "PG-13"
new_movie1["studio_id"] = warner_bros["id"]
new_movie1.save

new_movie2 = Movie.new
new_movie2["title"] = "The Dark Knight"
new_movie2["year_released"] = "2008"
new_movie2["rated"] = "PG-13"
new_movie2["studio_id"] = warner_bros["id"]
new_movie2.save

new_movie3 = Movie.new
new_movie3["title"] = "The Dark Knight Rises"
new_movie3["year_released"] = "2012"
new_movie3["rated"] = "PG-13"
new_movie3["studio_id"] = warner_bros["id"]
new_movie3.save

actor1 = Actor.new
actor1["name"] = "Christian Bale"
actor1.save

actor2 = Actor.new
actor2["name"] = "Michael Caine"
actor2.save

actor3 = Actor.new
actor3["name"] = "Liam Neeson"
actor3.save

actor4 = Actor.new
actor4["name"] = "Katie Holmes"
actor4.save

actor5 = Actor.new
actor5["name"] = "Gary Oldman"
actor5.save

actor6 = Actor.new
actor6["name"] = "Heath Ledger"
actor6.save

actor7 = Actor.new
actor7["name"] = "Aaron Eckhart"
actor7.save

actor8 = Actor.new
actor8["name"] = "Maggie Gyllenhaal"
actor8.save

actor9 = Actor.new
actor9["name"] = "Tom Hardy"
actor9.save

actor10 = Actor.new
actor10["name"] = "Joseph Gordon-Levitt"
actor10.save

actor11 = Actor.new
actor11["name"] = "Anne Hathaway"
actor11.save

#roles
bruce_wayne = Actor.find_by({"name" => "Christian Bale"})
alfred = Actor.find_by({"name" => "Michael Caine"})
ra = Actor.find_by({"name" => "Liam Neeson"})
rachel_1 = Actor.find_by({"name" => "Katie Holmes"})
commissioner = Actor.find_by({"name" => "Gary Oldman"})
joker = Actor.find_by({"name" => "Heath Ledger"})
harvey = Actor.find_by({"name" => "Aaron Eckhart"})
rachel_2 = Actor.find_by({"name" => "Maggie Gyllenhaal"})
bane = Actor.find_by({"name" => "Tom Hardy"})
john_blake = Actor.find_by({"name" => "Joseph Gordon-Levitt"})
selina_kyl = Actor.find_by({"name" => "Anne Hathaway"})


#movies
batman_begins = Movie.find_by({"title" => "Batman Begins"})
dark_knight = Movie.find_by({"title" => "The Dark Knight"})
dark_knight_rises = Movie.find_by({"title" => "The Dark Knight Rises"})

#Bruce Wayne
role1 = Role.new
role1["character_name"] = "Bruce Wayne"
role1["movie_id"] = batman_begins["id"]
role1["actor_id"] = bruce_wayne["id"]
role1.save

role2 = Role.new
role2["character_name"] = "Bruce Wayne"
role2["movie_id"] = dark_knight["id"]
role2["actor_id"] = bruce_wayne["id"]
role2.save

role3 = Role.new
role3["character_name"] = "Bruce Wayne"
role3["movie_id"] = dark_knight_rises["id"]
role3["actor_id"] = bruce_wayne["id"]
role3.save

#alfred
role4 = Role.new
role4["character_name"] = "Alfred"
role4["movie_id"] = batman_begins["id"]
role4["actor_id"] = alfred["id"]
role4.save

role5 = Role.new
role5["character_name"] = "Alfred"
role5["movie_id"] = dark_knight["id"]
role5["actor_id"] = alfred["id"]
role5.save

#Ra's Al Ghul
role6 = Role.new
role6["character_name"] = "Ra's Al Ghul"
role6["movie_id"] = batman_begins["id"]
role6["actor_id"] = ra["id"]
role6.save

#Rachel - Katie
role7 = Role.new
role7["character_name"] = "Rachel Dawes"
role7["movie_id"] = batman_begins["id"]
role7["actor_id"] = rachel_1["id"]
role7.save

#Rachel - Maggie
role8 = Role.new
role8["character_name"] = "Rachel Dawes"
role8["movie_id"] = dark_knight["id"]
role8["actor_id"] = rachel_2["id"]
role8.save

#Commissioner Gordon
role9 = Role.new
role9["character_name"] = "Commissioner Gordon"
role9["movie_id"] = batman_begins["id"]
role9["actor_id"] = commissioner["id"]
role9.save

role10 = Role.new
role10["character_name"] = "Commissioner Gordon"
role10["movie_id"] = dark_knight_rises["id"]
role10["actor_id"] = commissioner["id"]
role10.save

#Joker
role11 = Role.new
role11["character_name"] = "Joker"
role11["movie_id"] = dark_knight["id"]
role11["actor_id"] = joker["id"]
role11.save

#Harvey Dent
role12 = Role.new
role12["character_name"] = "Harvey Dent"
role12["movie_id"] = dark_knight["id"]
role12["actor_id"] = harvey["id"]
role12.save

#Harvey Dent
role13 = Role.new
role13["character_name"] = "Harvey Dent"
role13["movie_id"] = dark_knight["id"]
role13["actor_id"] = harvey["id"]
role13.save

#Bane
role16 = Role.new
role16["character_name"] = "Bane"
role16["movie_id"] = dark_knight_rises["id"]
role16["actor_id"] = bane["id"]
role16.save

#John Blake
role14 = Role.new
role14["character_name"] = "John Bake"
role14["movie_id"] = dark_knight_rises["id"]
role14["actor_id"] = john_blake["id"]
role14.save


#Selina Kyl
role15 = Role.new
role15["character_name"] = "Selina Kyl"
role15["movie_id"] = dark_knight_rises["id"]
role15["actor_id"] = selina_kyl["id"]
role15.save

#puts "studios: #{Studio.all.count}"
#puts "movies: #{Movie.all.count}"
#puts "Actors: #{Actor.all.count}"
#puts "Roles: #{Role.all.count}"

# Prints a header for the movies output
puts "Movies"
puts "======"
puts ""

 movies = Movie.all
 for movie in movies  
    title = movie["title"]
    year_released = movie["year_released"]
    rated = movie["rated"]

     studio = Studio.find_by({"id" => movie["studio_id"]})
     studio_name = studio["name"]

    puts "#{title}        #{year_released}          #{rated}          #{studio_name}"
 end

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
#     actor = Actor.find_by({"id" => role["id"]})
#     actor_name = actor["name"]

#     movie = Movie.find_by({"id" => role["movie_id"]})
#     movie_title = movie["title"]

# puts "#{movie_title}        #{actor_name}       #{role_name}"
# end

# Query the cast data and loop through the results to display the cast output for each movie.
# TODO!
