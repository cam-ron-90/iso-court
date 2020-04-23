class Charge < ApplicationRecord
  belongs_to :group

  has_many :user_charges
  has_many :users, through: :user_charges

  has_many :sentences

  validates :category, presence: true
  validates :description, presence: true
end
