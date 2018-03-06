# frozen_string_literal: true
Given('I am logged in') do
  user = Accounts::Models::User.new
  email = 'test@test.com'
  password = '123456'
  user.email = email
  user.password = password
  user.save
  visit '/users/sign_in'
  fill_in 'Email', with: email
  fill_in 'Password', with: password
  click_on 'Log in'
  @current_user = user
end
