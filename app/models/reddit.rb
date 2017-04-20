class Reddit < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
end
