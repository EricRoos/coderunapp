When("I go to the homepage") do
  visit '/'
end
Then("I should not see the welcome messages") do
  expect(page).to_not have_content('CodeRun')
end

Then("I should see the welcome messages") do
  expect(page).to have_content('CodeRun')
end

Then("I should see the Message Center") do
  expect(page).to have_content('Message Center')
end
