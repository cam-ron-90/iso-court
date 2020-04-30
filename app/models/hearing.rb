class Hearing < ApplicationRecord
  belongs_to :group
  has_many :charges
end
