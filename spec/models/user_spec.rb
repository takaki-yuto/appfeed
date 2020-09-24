require "rails_helper"

RSpec.describe User, type: :model do
  let(:user) { FactoryBot.build(:user) }
  describe "name" do
    context "不正な入力ケース" do
      example "空白のみの場合" do
        user.name = " "
        expect(user).to be_invalid
      end

      example "nilの場合" do
        user.name = nil
        expect(user).to be_invalid
      end
      
      example "５０文字を超える入力" do
        user.name = "a" * 51
        expect(user).to be_invalid
      end

      example "５０文字の入力" do
        user.name = "a" * 50
        expect(user).to be_valid
      end
    end
  end
  
  describe "passwordのハッシュ関数への変換の評価" do
    context "文字列を与える" do
      example "hashed_passwordは長さ60の文字列になる" do
        user.password = "appfeed"
        user.save!
        expect(user.hashed_password).to be_kind_of(String)
        expect(user.hashed_password.length).to eq(60)
      end
    end

    context "nilを与える" do
      example "hash_passwordはnilになる" do
        user = FactoryBot.build(:user, hashed_password: "x")
        user.password = nil
        expect(user.hashed_password).to be_nil
      end
    end
  end

  describe "hash_password" do
    context "適正な入力ケース" do
      example "６文字以上の文字列である場合" do
        user.hashed_password = "fooboobar"
        expect(user).to be_valid
      end
    end

    context "不正な入力ケース" do
      example "blankの場合" do
        user.hashed_password = " " * 6
        expect(user).to be_invalid
      end

      example "6文字未満の場合" do
        user.hashed_password = "a" * 5
        expect(user).to be_invalid
      end
    end
  end
  
  describe "email" do
    context "不正な入力ケース" do
      let(:domain) { "@exapmle.com" }
      example "255文字を超える入力" do
        user.email = "a" * (256 - domain.length) + domain
        expect(user.email.length).to eq(256)
        expect(user).to be_invalid
      end
      
      example "255文字の入力" do
        user.email = "a" * (255 - domain.length) + domain
        expect(user.email.length).to eq(255)
        expect(user).to be_valid
      end

      example "ドメインに','を含む場合" do
        user.email = "user@foo,com"
        expect(user).to be_invalid
      end

      example "@を含まない入力の場合" do
        user.email = "user_at_foo.org"
        expect(user).to be_invalid
      end

      example "@が2つ含む場合" do
        user.email = "example.user@foo.foo@bar_baz.com"
        expect(user).to be_invalid
      end
      
      example "@以下に'+'を含む場合" do
        user.email = "foo@bar+baz.com "
        expect(user).to be_invalid
      end    
      
      example "ドメインの'..'を含む場合" do
        user.email = "foo@bar..com"
        expect(user).to be_invalid
      end
      
      example "nilの場合" do
        user.email = nil
        expect(user).to be_invalid
      end

      example "空白の場合" do
        user.email = " "
        expect(user).to be_invalid
      end
    end

    context "emailのupcaseとdowncaseでの入力パターンの評価" do
      example "emailにupcaseを含む入力した場合" do
        user.email = "TAKAKIYUTO@gmaiL.COM"
        down_case_email = user.email.downcase
        user.save!
        expect(user.email).to be_kind_of(String)
        expect(user.reload.email).to eq(down_case_email)
      end
    end

    context "emailの一意性の評価" do
      let(:user2) { FactoryBot.build(:user) }
      example "異なるアドレスが入力された場合" do
        user.save!
        user2.email = "boo@bar.com"
        expect(user2).to be_valid
      end

      example "同一のアドレスが入力された場合" do
        user.email = user2.email = "bar@foo.com"
        user.save!
        expect(user2).to be_invalid
      end
    end
  end

  describe "birth_date" do
    context "不正な入力ケース" do
      example "空白のみの場合" do
        user.birth_date = " "
        expect(user).to be_invalid
      end

      example "nilの場合" do
        user.birth_date = nil
        expect(user).to be_invalid
      end

      example "未来の日付の場合" do
        user.birth_date = Date.today.tomorrow
        expect(user).to be_invalid
      end
    end
  end
end 
