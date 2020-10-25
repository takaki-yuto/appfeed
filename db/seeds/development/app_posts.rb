user = User.create(
  name: "takaki yuto", 
  email: "example@example.com",
  password: "password",
  birth_date: "2020-01-01"
)
user.save!
100.times do |n|
  name = "appfeed"
  dev_env ="mac"
  lang = "ruby, javascript"
  lib_fram = "rails, JQuery"
  other = ""
  bg = "作成したアプリを共有できる環境を作りたいと思ったため"
  dev_per = "2ヶ月"
  detail = Faker::Markdown.random
  user_id = user.id
  user.app_posts.create!(
  name: name,
  dev_environment: dev_env,
  using_language: lang,
  using_lib_fram: lib_fram,
  using_other: other,
  background: bg,
  dev_period: dev_per,
  detail: detail,
  user_id: user_id
  )
end