class AppPost < ApplicationRecord
  belongs_to :user
  has_many :feedbacks,         dependent: :destroy
  
  validates :name, 
            presence: true, length: { maximum: 190 }
  validates :dev_environment, :using_language, :detail,
            presence: true
  validates :dev_period, length: { maximum: 190 } 

end