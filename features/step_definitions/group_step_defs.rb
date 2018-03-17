When("I view the group page") do
  @group = @groups.last
  visit "/organizations/#{@organization.id}/groups/#{@group.id}"
end

Then("I should see the group's name") do
  expect(page).to have_content(@group.name)
end

Then("I should see the name of the last {int} projects I added") do |num|
  Domain::Models::Project.last(num).each do |project|
    expect(page).to have_content(project.title)
  end
end

Given("the group has {int} projects") do |num_projects|
  @group ||= @groups.last
  num_projects.times do
    @group.projects << Domain::Models::Project.new(title: Faker::Company.name)
  end
  @projects = @group.projects
end
