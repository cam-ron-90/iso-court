class UserGroup < ApplicationRecord
  STATUS = ['invited', 'pending', 'member']
  validates :status, presence: true, inclusion: { in: STATUS }

  belongs_to :user
  belongs_to :group
end
