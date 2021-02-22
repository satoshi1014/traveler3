class Spot < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :place, presence: true
  validates :address, presence: true
  validates :one_word, presence: true
  validates :thought, presence: true
  validates :image, presence: true
end
