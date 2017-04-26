class Post < ApplicationRecord
  belongs_to :user
  belongs_to :reddit
  validates :title, presence: true
end
