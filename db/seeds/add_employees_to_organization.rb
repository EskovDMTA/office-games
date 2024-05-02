def add_employees_to_organizations
  organizations = Organization.all

  organizations.each do |organization|
    users = User.where(organization: nil).limit(8)
    organization.users << users
  end
  puts "Employees added to organizations"
end
