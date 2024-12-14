desc "Fill the database tables with some sample data"
task sample_data: :environment do
  usernames = ["Karen", "Theo", "Georgie", "Aly", "Kboy"]
end
#   usernames.each do |username|
#     user = User.new(
#       email: "#{username}@example.com",
#       password: "password",
#       username: "#{username}WillLose"
#     )
#     if user.save
#       puts "Created user: #{user.email}"
#     else
#       puts "Error creating user: #{user.errors.full_messages.join(', ')}"
#     end
#   end
# end

namespace :dev do
  desc "Populate Skins and Bids with sample data"
  task populate: :environment do
    # Create users
    user1 = User.find_or_create_by!(email: "alice@example.com") { |u| u.password = "password" }
    user2 = User.find_or_create_by!(email: "bob@example.com") { |u| u.password = "password" }

    # Create skins
    skins = Skin.create!(
      [
        { name: "Galaxy Design", description: "A cool galaxy-themed skin.", starting_price: 20.0, user: user1 },
        { name: "Floral Pattern", description: "A skin with a beautiful floral design.", starting_price: 15.0, user: user2 },
        { name: "Minimal Black", description: "A sleek black skin for simplicity lovers.", starting_price: 25.0, user: user1 }
      ]
    )

    # Create bids for the first skin
    Bid.create!(
      [
        { amount: 22.0, user: user1, skin: skins.first },
        { amount: 24.0, user: user2, skin: skins.first }
      ]
    )

    puts "Sample data populated successfully!"
  end
end
