#declarative step for populating the DB with a few articles

Given /the following articles exist/ do |articles_table|
  articles_table.hashes.each do |a|
    Article.create!(a)
  end
end



Then /I should be on the page of the new article/ do
end
