class Feedback < ApplicationRecord
  belongs_to :user
  belongs_to :app_post

  validates :comment, presence: true
end
