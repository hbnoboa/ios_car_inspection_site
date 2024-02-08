class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable

  # Add custom fields
  validates :name, :login, presence: true
  
  ROLES = ["user", "manager", "admin"].freeze

  validates :role, inclusion: { in: ROLES }

  before_save :ensure_authentication_token

  private

  def ensure_authentication_token
    if authentication_token.blank?
      self.authentication_token = generate_unique_token
    end
  end

  def generate_unique_token
    loop do
      token = Devise.friendly_token
      break token unless User.exists?(authentication_token: token)
    end
  end
end
