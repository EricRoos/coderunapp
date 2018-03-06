Then("I should see {string}") do |string|
  expect(page).to have_content(string)
end

When("I press submit") do
  find("input[type=submit]").click
end

When("I click {string}") do |string|
  click_on string
end

When("I wait for ajax") do
  Timeout.timeout(Capybara.default_max_wait_time) do
    loop until page.evaluate_script('$.active').to_i.zero?
  end
end
