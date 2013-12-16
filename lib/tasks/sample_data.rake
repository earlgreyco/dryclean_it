namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(name: "Genghis Khan",
                         email: "genghis@khan.com",
                         password: "genghis123",
                         password_confirmation: "genghis123",
                         admin: true)

    50.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end

    users = User.all(limit:5)

    users.each do |user|
      50.times do |n|
        title = Faker::Commerce.product_name
        description = Faker::Company.catch_phrase
        user.recipes.create!(title: title, description: description)
      end
    end

    recipes = Recipe.all(limit:50)

    recipes.each do |recipe|
      10.times do |n|
        title = Faker::Commerce.product_name
        quantity = Faker::Number.digit
        recipe_id = recipe
        Ingredient.create!(title: title,
                           quantity: quantity,
                           recipe_id: recipe_id)
      end
    end
  end
end