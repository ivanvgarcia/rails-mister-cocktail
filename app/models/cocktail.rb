class Cocktail < ApplicationRecord
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses
  has_many :likes
  validates :name, presence: true, uniqueness: true
  mount_uploader :photo, PhotoUploader
end
