class Hearing < ApplicationRecord
  belongs_to :group

  has_many :user_charges
  # has_many :charges, through: :user_charges
end
