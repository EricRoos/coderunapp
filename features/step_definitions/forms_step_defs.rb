# frozen_string_literal: true
When('I fill out the new group form') do
  name = Faker::Company.name
  fill_in 'Name', with: name
end

When('I fill out the new project form') do
  title = Faker::Company.name
  fill_in 'Title', with: title 
end

When('I fill out the new group form with duplicate data') do
  name = Domain::Models::Group.last.name
  fill_in 'Name', with: name
end

When('I fill out the new project form with duplicate data') do
  title = Domain::Models::Project.last.title
  fill_in 'Title', with: title 
end
