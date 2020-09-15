FactoryBot.define do
  factory :user do
    name { "hoge" }
    email { "foo@bar.com" }
    birth_date { "2020-01-01"}
    hashed_password { "foobar" }
  end
end