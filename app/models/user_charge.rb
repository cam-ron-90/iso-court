class UserCharge < ApplicationRecord
  belongs_to :user
  belongs_to :charge
  belongs_to :hearing
  belongs_to :judge, class_name: 'User'

  has_one :sentence
end
