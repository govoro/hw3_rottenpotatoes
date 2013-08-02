# Add a declarative step here for populating the DB with movies.

Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    #debugger
    
    Movie.create movie unless Movie.where(title: movie['title'])
	
  end
  #flunk "Unimplemented"
end

# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
  flunk "Ulslsllllnimplemented"
end

# Make it easier to express checking or unchecking several boxes at once
#  "When I uncheck the following ratings: PG, G, R"
#  "When I check the following ratings: G"

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  # HINT: use String#split to split up the rating_list, then
  #   iterate over the ratings and reuse the "When I check..." or
  #   "When I uncheck..." steps in lines 89-95 of web_steps.rb
  #debugger
  #'+((uncheck && 'un') || '')+'
  rating_list.split(",").each do |r|
	#step 'When I check "ratings_#{r}"'
	#step %{When I check "ratings_#{r.strip}"}
	field = %{ratings_#{r.strip}}
	if uncheck
		uncheck(field)
	else
		check(field)
	end
	
  end
end

When /I (un)?check all ratings except the following: (.*)/ do |uncheck, rating_list|
  selected = rating_list.split(",")
  Movie.all_ratings.each do |r|
	field = %{ratings_#{r.strip}}
	if not selected.member? r
		if uncheck
			uncheck(field)
		else
			check(field)
		end
	end
  end
end
