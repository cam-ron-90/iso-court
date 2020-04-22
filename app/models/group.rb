class Group < ApplicationRecord
  validates :name, presence: true

  has_many :user_groups, dependent: :destroy
  has_many :users, through: :user_groups
  belongs_to :admin, class_name: 'User'

  after_create :admin_as_member

  def admin_as_member
    UserGroup.create(group: self, user: self.admin, status: 'member')
  end

  def members
    UserGroup.where(group: self, status: 'member')
  end

  def invited
    UserGroup.where(group: self, status: 'invited')
  end

  def pending
    UserGroup.where(group: self, status: 'pending')
  end
end
