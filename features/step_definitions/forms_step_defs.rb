# frozen_string_literal: true
When('I fill out the new group form') do
  name = Faker::Company.name
  fill_in 'Name', with: name
end

When('I fill out the new group form with duplicate data') do
  name = Domain::Models::Group.last.name
  fill_in 'Name', with: name
end
