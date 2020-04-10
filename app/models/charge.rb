class Charge < ApplicationRecord
  has_many :user_charges
  has_many :sentences

  validates :category, presence: true
  validates :description, presence: true
end
