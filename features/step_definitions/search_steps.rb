Given(/^I am on dubizzle home page$/) do
  base_url = "https://dubai.dubizzle.com"
  home_page = Homepage.new(@driver)
  is_on_homepage = home_page.go_to(base_url)
  is_on_homepage.should == true
end

When(/^I select the (.*) on the menu$/) do |section|
  home_page = Homepage.new(@driver)
  (home_page.select_section(section.downcase).downcase).include?('dubai').should == true
end

And(/^I select section (.*)$/) do |category|
  search_refinements = SearchRefinements.new(@driver)
  search_refinements.select_category(category)
end

And(/^I select model (.*)$/) do |model|
  search_refinements = SearchRefinements.new(@driver)
  search_refinements.select_sub_category(model)
end

And(/^I select make (.*)$/) do |make|
  search_refinements = SearchRefinements.new(@driver)
  search_refinements.select_sub_sub_category(make)
end

And(/^I search$/) do
  search_refinements = SearchRefinements.new(@driver)
  (search_refinements.select_search.downcase).include?('dubai').should == true
end

And(/^I sort result from (.*)$/) do |sort_order |
  search_refinements = SearchRefinements.new(@driver)
  search_refinements.select_sort sort_order
end

Then(/^I should see listings sorted from (.*)$/) do |sort_order|
  search_refinements = SearchRefinements.new(@driver)
  search_refinements.verify_sort_order(sort_order).should == true
end

And(/^I select sub category (.*)$/) do |sub_category|
  search_refinements = SearchRefinements.new(@driver)
  search_refinements.select_sub_category(sub_category)
end

And(/^I select category section (.*)$/) do |category_section|
  search_refinements = SearchRefinements.new(@driver)
  search_refinements.select_sub_sub_category(category_section)
end

