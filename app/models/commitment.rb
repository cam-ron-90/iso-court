class Commitment < ApplicationRecord
  belongs_to :hearing
  belongs_to :group
  has_many :user_commitments

  validates :category, presence: true
  validates :description, presence: true

  private

  def set_defaults
    self.status = 'pending'
  end
end
