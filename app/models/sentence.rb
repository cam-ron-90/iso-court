class Sentence < ApplicationRecord
  belongs_to :charge
  belongs_to :user_charge

  validates :description, presence: true
end
