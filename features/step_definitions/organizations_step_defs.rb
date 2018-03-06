Given("I am part of an organization") do
  @organization = Domain::Models::Organization.create(name: Faker::Company.name)
end

Given("the organization has {int} groups") do |num_groups|
  @groups = []
  num_groups.times do
    @organization.groups << Domain::Models::Group.new(name: Faker::Company.name)
  end
  @groups = @organization.groups
end

When("I view the organization page") do
  visit "/organizations/#{@organization.id}"
end

Then("I should see the organization's name") do
  expect(page).to have_content(@organization.name)
end

Then("I should see {int} groups") do |num|
  expect(all('.group').size).to eq(num)
  @groups.each do |group|
    expect(page).to have_content(group.name)
  end
end

Given("I am on the organization page") do
  visit "/organizations/#{@organization.id}"
end

Then("I should see the name of the last {int} groups I added") do |num|
  Domain::Models::Group.last(num).each do |group|
    expect(page).to have_content(group.name)
  end
end

