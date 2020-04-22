class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: :true
  validates :email, presence: :true
  validates :password, presence: :true

  has_one_attached :avatar

  has_many :user_groups, dependent: :destroy
  has_many :groups, through: :user_groups

  def admin_groups
    Group.where(admin: self)
  end
end
