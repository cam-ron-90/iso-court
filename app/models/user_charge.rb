class UserCharge < ApplicationRecord
  after_initialize :set_defaults
  belongs_to :user
  belongs_to :charge
  belongs_to :hearing
  belongs_to :judge, class_name: 'User'

  def set_defaults
    self.verdict = 'pending'
  end
end
