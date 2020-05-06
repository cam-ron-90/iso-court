class Group < ApplicationRecord
  validates :name, presence: true

  has_many :user_groups
  has_many :users, through: :user_groups

  has_many :laws

  has_many :hearings
  has_one :chatroom

  belongs_to :admin, class_name: 'User'

  after_create :admin_as_member, :set_first_hearing, :create_chatroom

  def admin_as_member
    UserGroup.create(group: self, user: self.admin, status: 'member')
  end

  def set_first_hearing
    Hearing.create(group: self)
  end

  def create_chatroom
    Chatroom.create(name: "#{self.name} chatroom", group: self)
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
