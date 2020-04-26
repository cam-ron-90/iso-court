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

  has_many :user_charges
  has_many :charges, through: :user_charges
  has_many :sentences, through: :user_charges

  has_many :user_commitments
  has_many :commitments, through: :user_commitments

  def admin_groups
    Group.where(admin: self)
  end

  def setting_total
    commitments.count.to_f + charges.count + sentences.count
  end

  def commitments_score
    if setting_total == 0
      return 0
    else
      score = (commitments.count.to_f / setting_total) * 100
      score.round
    end
  end

  def charges_score
    if setting_total == 0
      return 0
    else
      score = (charges.count.to_f / setting_total) * 100
      score.round
    end
  end

  def sentences_score
    if setting_total == 0
      return 0
    else
      score = (sentences.count.to_f / setting_total) * 100
      score.round
    end
  end
end
