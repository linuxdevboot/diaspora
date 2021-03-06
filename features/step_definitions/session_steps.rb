Given /^(?:I am signed in)$/ do
  automatic_login
  confirm_login
end

When /^I try to sign in manually$/ do
  manual_login
end

When /^I (?:sign|log) in manually as "([^"]*)" with password "([^"]*)"$/ do |username, password|
  @me = User.find_by_username(username)
  @me.password ||= password
  manual_login
  confirm_login
end

When /^I (?:sign|log) in as "([^"]*)"$/ do |email|
  @me = User.find_by_email(email)
  @me.password ||= 'password'
  automatic_login
  confirm_login
end

When /^I (?:sign|log) in as "([^"]*)" on the mobile website$/ do |email|
  @me = User.find_by_email(email)
  @me.password ||= 'password'
  automatic_login
  confirm_login_mobile
end

When /^I (?:sign|log) in manually as "([^"]*)" with password "([^"]*)" on the mobile website$/ do |username, password|
  @me = User.find_by_username(username)
  @me.password ||= password
  manual_login
  confirm_login_mobile
end

When /^I (?:sign|log) in with password "([^"]*)"$/ do |password|
  @me.password = password
  automatic_login
  confirm_login
end

When /^I put in my password in "([^"]*)"$/ do |field|
 step %(I fill in "#{field}" with "#{@me.password}")
end

When /^I fill out change password section with my password and "([^"]*)" and "([^"]*)"$/ do |new_pass, confirm_pass|
  fill_change_password_section(@me.password, new_pass, confirm_pass)
end

When /^I fill out forgot password form with "([^"]*)"$/ do |email|
  fill_forgot_password_form(email)
end

When /^I submit forgot password form$/ do
  submit_forgot_password_form
end

When /^I fill out the password reset form with "([^"]*)" and "([^"]*)"$/ do |new_pass,confirm_pass|
  fill_password_reset_form(new_pass, confirm_pass)
end

When /^I submit the password reset form$/ do
  submit_password_reset_form
end

When /^I (?:log|sign) out$/ do
  logout
end

When /^I (?:log|sign) out manually$/ do
  manual_logout
end

When /^I (?:log|sign) out manually on the mobile website$/ do
  manual_logout_mobile
end

Then(/^I should not be able to sign up$/) do
  confirm_not_signed_up
end

Then (/^I should see the 'getting started' contents$/) do
  confirm_getting_started_contents
end
