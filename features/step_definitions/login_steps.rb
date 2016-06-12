#require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))

Given /^I am a new, authenticated user$/ do
  email = 'admin@user.com'
  password = 'adminadmin'
  FactoryGirl.create(:user_admin)

  visit '/login'
  fill_in "Email", :with => email
  fill_in "Password", :with => password
  click_button "Login"
  expect(page).to have_content("Achievement")
end


=begin
And (/^I fill in "Email" with "admin@user.com"$/) do
  fill_in 'session_email', :with=> 'admin@user.com'
end

And (/^I fill in "Email" with "admin.com"$/) do
  fill_in 'session_email', :with=> 'admin.com'
end

And (/^I fill in "Password" with "adminadmin"$/) do
  fill_in 'session_password', :with=> 'adminadmin' admin
end

And (/^I fill in "Password" with "123"$/) do
  fill_in 'session_password', :with=> '123'
end

When (/^I press "Login" button/) do
  click_button ("Login")
end

Then (/^I should be redirect to achievements"/) do
  expect(page).to have_content("PurrSuit Login Acesso restrito ao administrador")
end

Then (/^the page should load with notice message "login failed!"/) do
  expect(page).to have_content("PurrSuit Login Acesso restrito ao administrador")
end
=end
