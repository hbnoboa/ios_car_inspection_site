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

  def generate_authentication_token
    JWT.encode({ user_id: id }, Rails.application.secrets.secret_key_base, 'HS256')
  end

  def self.find_by_authentication_token(token)
    decoded_token = JWT.decode(token, Rails.application.secrets.secret_key_base, true, algorithm: 'HS256')[0]
    find_by(id: decoded_token['user_id']) if decoded_token.present?
  rescue JWT::DecodeError
    nil
  end
end