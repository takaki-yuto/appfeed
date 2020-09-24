require 'rails_helper'

RSpec.describe AppPost, type: :model do
  let(:app_post) { FactoryBot.build(:app_post) }
  describe "name" do
    context "不正な入力ケース" do
      example "空白のみの場合" do
        app_post.name = " "
        expect(app_post).to be_invalid
      end

      example "nilの場合" do
        app_post.name = nil
        expect(app_post).to be_invalid
      end

      example "191文字以上の場合" do
        app_post.name = "a" * 191
        expect(app_post).to be_invalid
      end

      example "190文字以下の場合" do
        app_post.name = "a" * 190
        expect(app_post).to be_valid
      end
    end
  end

  describe "dev_environment" do
    context "不正な入力ケース" do
      example "空白のみの場合" do
        app_post.dev_environment = " "
        expect(app_post).to be_invalid
      end

      example "nilの場合" do
        app_post.dev_environment = nil
        expect(app_post).to be_invalid
      end
    end
  end

  describe "using_language" do
    context "不正な入力ケース" do
      example "空白のみの場合" do
        app_post.using_language = " "
        expect(app_post).to be_invalid
      end
      
      example "nilの場合" do
        app_post.using_language = nil
        expect(app_post).to be_invalid
      end
    end
  end

  describe "detail" do
    context "不正な入力ケース" do
      example "空白のみの場合" do
        app_post.detail = " "
        expect(app_post).to be_invalid
      end
  
      example "nilの場合" do
        app_post.detail = nil
        expect(app_post).to be_invalid
      end
    end
  end

  describe "dev_environment" do
    context "不正な入力ケース" do
      example "空白のみの場合" do
        app_post.dev_environment = " "
        expect(app_post).to be_invalid
      end
  
      example "nilの場合" do
        app_post.dev_environment = nil
        expect(app_post).to be_invalid
      end
    end
  end


  describe "dev_period" do
    context "不正な入力ケース" do
      example "191文字以上の場合" do
        app_post.dev_period = "a" * 191
        expect(app_post).to be_invalid
      end
  
      example "190文字以下の場合" do
        app_post.dev_period = "a" * 190
        expect(app_post).to be_valid
      end
    end
  end
end
