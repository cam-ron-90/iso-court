class Charge < ApplicationRecord
  after_initialize :set_defaults
  belongs_to :hearing
  belongs_to :group
  belongs_to :judge, class_name: 'User'

  has_many :user_charges
  has_many :users, through: :user_charges

  has_many :sentences

  validates :category, presence: true
  validates :description, presence: true

  private

  def set_defaults
    self.verdict = 'pending'
  end
end
