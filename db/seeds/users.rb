def create_users
  50.times do
    User.create!(
      email: Faker::Internet.unique.email,
      password: 'password',
      password_confirmation: 'password',
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      profession: Faker::Job.title,
      jti: SecureRandom.uuid
    )
  end
  puts "Users created"
end
