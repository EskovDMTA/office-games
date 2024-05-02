def create_organizations
    users = User.all.sample(5)
    users.each do |user|
      organization = Organization.create!(
        name: Faker::Company.name,
        description: Faker::Lorem.sentence,
        address: Faker::Address.full_address,
        email: Faker::Internet.email,
        telegram: Faker::Internet.username,
        owner_id: user.id
      )
      user.update!(organization: organization)

    end
    puts "Organizations created"
end
