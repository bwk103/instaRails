class User < ApplicationRecord

  acts_as_voter

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  validates :name, presence: true
  validates :username, presence: true, uniqueness: { case_sensitive: false }
  validates :bio, length: { maximum: 150 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: { case_sensitive: false },
                                    format: { with: VALID_EMAIL_REGEX }
  has_secure_password
  validates :password, presence: true, length: { minimum: 5 }
  mount_uploader :profile, ProfileUploader


  def User.digest(password)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(password, cost: cost)
  end

  def User.all_except(user)
    where.not(id: user.id)
  end

end
