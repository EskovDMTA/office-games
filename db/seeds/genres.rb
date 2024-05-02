def create_genres
  genres = ['Action', 'Adventure', 'Role-playing (RPG)', 'Strategy', 'Simulation', 'Sports', 'Puzzle', 'Horror', 'Survival']
  genres.each {|genre, index| GameType.create!(name: genre, description:index, status: 1 )}
  puts "GameType created"
end
