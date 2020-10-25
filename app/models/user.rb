class User < ApplicationRecord
  has_many :app_posts
  has_many :feedbacks

  before_save { email.downcase! }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  validates :name, 
            presence: true, length: { maximum: 50 }
  validates :email, 
            presence: true, length: { maximum: 255 },
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false } 
  validates :hashed_password, 
            presence:true, length: { minimum: 6 }
  validate  :birth_date_cannot_be_in_the_future

  def password=(raw_password)
    if raw_password.kind_of?(String)
      self.hashed_password = BCrypt::Password.create(raw_password)
    elsif raw_password.nil?
      self.hashed_password = nil
    end
  end

  def birth_date_cannot_be_in_the_future
    if !birth_date.present?
      errors.add(:birth_date, ": 値を入力してください")
    elsif birth_date.present? && birth_date > Date.today
      errors.add(:birth_date, ": 未来の日付は使えません")
    end
  end
end
