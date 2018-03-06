# frozen_string_literal: true
When('I go to the homepage') do
  visit '/'
end
Then('I should not see the welcome messages') do
  expect(page).to_not have_content('CodeRun')
end

Then('I should see the welcome messages') do
  expect(page).to have_content('CodeRun')
end

Then('I should see the Message Center') do
  expect(page).to have_content('Message Center')
end

Given('I am apart of {int} organization') do |int|
  int.times do
    org = ::Domain::Models::Organization.create(name: 'test')
    @current_user.organizations << org
  end
end

Then('I should see my organizations names') do
  within('#organizations') do
    @current_user.organizations.each do |org|
      expect(page).to have_content(org.name)
    end
  end
end
