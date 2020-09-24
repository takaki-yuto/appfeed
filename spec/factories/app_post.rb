FactoryBot.define do
  factory :app_post do
    association :user
    name { "appfeed" }
    dev_environment { "OS: mac" }
    using_language { "javascript, ruby"}
    using_lib_fram { "JQuery, ruby on rails" }
    using_other { " " }
    detail { "アプリ紹介サイト" }
    background { "駆け出しエンジニアが互いにフィードバックしあえる環境を作りたい" }
    dev_period { "約２ヶ月" }
  end
end