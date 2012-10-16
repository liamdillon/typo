#declarative step for populating the DB with a few articles

Given /the following articles exist/ do |articles_table|
  articles_table.hashes.each do |a|
    Article.create!(a)
  end
end

Given /I am logged in as admin/ do
  visit '/admin'
end

Then /I should be admin page/ do
     curr_path = URI.parse(current_url).path
     assert_equal curr_path, '/admin'
end
