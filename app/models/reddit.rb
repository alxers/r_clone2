class Reddit < ApplicationRecord
  belongs_to :user
  has_many :posts, dependent: :destroy
  validates :title, presence: true
end
