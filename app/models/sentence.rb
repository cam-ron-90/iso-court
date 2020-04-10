class Sentence < ApplicationRecord
  belongs_to :charge
  belongs_to :user

  validates :description, presence: true
end
