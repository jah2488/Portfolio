


Given /^I am on the posts index$/ do
  @post = Fabricate.build(:post)
   visit '/'
end

When /^I click the "([^"]*)" link$/ do |link|
  click_link(link)
end

Then /^I should see the "([^"]*)" link$/ do |link_name|
  page.should have_selector(link_name)
end

Then /^I should see the rss content$/ do
  page.should have_content('RSS')
end

Then /^I should see the atom content$/ do
  page.should have_content('ATOM')
end
