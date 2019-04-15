# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def seed_users
  user_id = 0
  count = 10
  count.times do
    User.create(
      username: "test_#{ user_id }",
      email: "test_#{ user_id }@test.com",
      password: '123456',
      password_confirmation: '123456'
    )
    user_id += 1
  end
  puts "#{ count } users created."
end

def seed_categories
  hobby = ['Arts', 'Crafts', 'Sports', 'Sciences', 'Collecting', 'Reading', 'Other']

  study = [
    'Arts and Humanities',  'Physical Science and Engineering', 'Math and Logic',
    'Computer Science',     'Data Science',                     'Economics and Finance',
    'Business',             'Social Sciences',                  'Language',
    'Other']

  team = ['Study', 'Development', 'Arts and Hobby', 'Other']

  hobby.each { |name| Category.create(branch: 'hobby', name: name) }
  study.each { |name| Category.create(branch: 'study', name: name) }
  team.each { |name| Category.create(branch: 'team', name: name) }
    total_categories = hobby.count + study.length + team.size
    puts "#{ total_categories } categories created."
end

def seed_posts
  categories = Category.all

  categories.each do |category|
    count = 5
    count.times do
      Post.create(
        title: Faker::Lorem.sentences[0],
        content: Faker::Lorem.sentences[0],
        user_id: rand(1..9),
        category_id: category.id
      )
    end
  end
  total_posts = Post.all.count
  puts "#{ total_posts } posts created."
end

seed_users
seed_categories
seed_posts
