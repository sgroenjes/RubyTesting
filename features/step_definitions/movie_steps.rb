# Add a declarative step here for populating the DB with movies.

Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    Movie.create!(movie)
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
  end
  #fail "Unimplemented"
end

Then(/^the director of "([^"]*)" should be "([^"]*)"$/) do |movie, director|
    Movie.find_by_title(movie).director.should == director
end