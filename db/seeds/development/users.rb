100.times do |n|
  name = Faker::JapaneseMedia::DragonBall.character
  email = Faker::Internet.email
  password = "password"
  birth_date = Faker::Date.birthday(min_age: 18, max_age: 65)
  User.create!(
    name: name,
    email: email,
    password: password,
    birth_date: birth_date
  )
end